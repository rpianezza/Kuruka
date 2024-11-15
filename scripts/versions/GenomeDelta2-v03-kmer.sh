#!/bin/bash

# Check if required arguments are provided
if [ "$#" -lt 6 ]; then
    echo "Usage: $0 <fastq> <kmer_set> <reference_genome> <bacterial_genome> <output_folder> <threads> [--min_kmer_n <min_kmer_n>] [--max_kmer_n <max_kmer_n>] [--identity_threshold <identity_threshold>]"
    exit 1
fi

# Command-line arguments
FASTQ="$1"
KMER_SET="$2"
REFERENCE_GENOME="$3"
BACTERIAL_GENOME="$4"
OUTPUT_FOLDER="$5"
THREADS="$6"
MIN_KMER_N=100  # Default minimum k-mer frequency
IDENTITY_THRESHOLD=0  # Default to skip low-identity recovery

# Parse optional arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --min_kmer_n)
            MIN_KMER_N="$2"
            shift 2
            ;;
        --max_kmer_n)
            MAX_KMER_N="$2"
            shift 2
            ;;
        --identity_threshold)
            IDENTITY_THRESHOLD="$2"
            shift 2
            ;;
        *)
            shift
            ;;
    esac
done

# Paths to tools: Jellyfish, SPAdes, bbduk.sh, and BWA
JELLYFISH="jellyfish"
SPADES="spades.py"
BBDUK="bbduk.sh"
BWA="bwa"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Extract base filename without extensions (.fastq, .fq, .fastq.gz, or .fq.gz)
BASENAME=$(basename "$FASTQ" | sed -E 's/\.(fastq.gz|fq.gz)$//')

# Step 1: Map reads to the reference genome using BWA-MEM and keep unmapped reads
echo "Mapping $FASTQ to $REFERENCE_GENOME and keeping unmapped reads..."

# Index the reference genome if not already indexed
if [ ! -f "${REFERENCE_GENOME}.bwt" ]; then
    $BWA index "$REFERENCE_GENOME"
fi

# Run BWA-MEM and save the SAM file
$BWA mem -t "$THREADS" "$REFERENCE_GENOME" "$FASTQ" > "$OUTPUT_FOLDER/${BASENAME}.sam"

# Extract unmapped reads into a BAM file
samtools view -b -f 4 "$OUTPUT_FOLDER/${BASENAME}.sam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam"

if (( $(echo "$IDENTITY_THRESHOLD != 0" | bc -l) )); then
    echo "Recovering reads mapped with less than $((1 - IDENTITY_THRESHOLD)) identity and with alignment length > 90% of read length..."
    # Extract reads mapped with less than specified identity threshold but aligned for most of their length
    samtools view -h "$OUTPUT_FOLDER/${BASENAME}.sam" | \
    awk -v maxpct=0.03 -v min_align=0.9 -v OFS='\t' '{
        if ($0 ~ /^@/) {
            print $0;
        } else if ($2 != 4) {
            nm = 0;
            aln_length = 0;
            for (i = 12; i <= NF; i++) {
                if ($i ~ /^NM:i:/) { nm = substr($i, 6) }
                if ($i ~ /^MD:Z:/) { aln_length = $6 }
            }

            cigar = $6;
            split(cigar, ops, /[MIDNSHPX=]/);
            num_ops = split(cigar, cig_op, "");
            aln_length = 0;
            for (j = 1; j <= num_ops; j++) {
                if (cig_op[j] ~ /^[M=X]$/) {
                    aln_length += ops[j];
                }
            }

            seq_length = length($10);
            if (seq_length > 0) {
                pct = nm / seq_length;
                align_ratio = aln_length / seq_length;
                if (pct > maxpct && align_ratio >= min_align) {
                    print $0, "XP:f:" pct, "XA:f:" align_ratio;
                }
            }
        }
    }' | samtools view -Sb - > "$OUTPUT_FOLDER/${BASENAME}-low_identity.bam"

    # Merge unmapped and low-identity BAM files
    samtools merge -f "$OUTPUT_FOLDER/${BASENAME}-combined.bam" \
        "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" \
        "$OUTPUT_FOLDER/${BASENAME}-low_identity.bam"
else
    # No identity threshold provided; use only unmapped reads
    echo "Skipping low-identity reads recovery step..."
    cp "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" "$OUTPUT_FOLDER/${BASENAME}-combined.bam"
fi

# Convert BAM file back to FASTQ format
samtools fastq "$OUTPUT_FOLDER/${BASENAME}-combined.bam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped.fastq"

# Trim reads (remove low quality, adapters, etc.) using bbduk.sh
echo "Trimming unmapped reads from $OUTPUT_FOLDER/${BASENAME}-unmapped.fastq..."
$BBDUK in="$OUTPUT_FOLDER/${BASENAME}-unmapped.fastq" out="$OUTPUT_FOLDER/${BASENAME}.unmapped.trimmed.fastq" qtrim=rl trimq=20 minlength=50 > /dev/null 2>&1

# Find and remove Wolbachia in the unmapped reads
echo "Removing Wolbachia sequences from $OUTPUT_FOLDER/${BASENAME}.unmapped.trimmed.fastq"
$BWA mem -t "$THREADS" "$BACTERIAL_GENOME" "$OUTPUT_FOLDER/${BASENAME}.unmapped.trimmed.fastq" | \
    samtools view -b -f 4 -o "$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.bam" -

samtools fastq "$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.bam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.fastq"

# Count kmers with Jellyfish for the trimmed FASTQ file
echo "Counting kmers in $OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.fastq..."
$JELLYFISH count -m 21 -s 100M -t "$THREADS" -C "$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.fastq" -o "$OUTPUT_FOLDER/${BASENAME}.kmer"

# Dump kmer counts to FASTA format
echo "Dumping kmers to FASTA file with min count $MIN_KMER_N and max count $MAX_KMER_N..."
$JELLYFISH dump -c -t -L "$MIN_KMER_N" "$OUTPUT_FOLDER/${BASENAME}.kmer" > "$OUTPUT_FOLDER/${BASENAME}.kmer.tsv"

awk '{print $1}' "$OUTPUT_FOLDER/${BASENAME}.kmer.tsv" | sort > "$OUTPUT_FOLDER/${BASENAME}.kmer.sorted.tsv"

# Find unique kmers from the provided kmer set
echo "Finding unique kmers from kmer set..."
comm -23 "$OUTPUT_FOLDER/${BASENAME}.kmer.sorted.tsv" "$KMER_SET" | \
awk '{print ">" NR "\n" $0}' > "$OUTPUT_FOLDER/${BASENAME}.unique.kmer.fasta"

# Find reads in FASTQ file containing any unique kmer
echo "Finding reads with unique kmers in $OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.fastq..."
$BBDUK in="$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.fastq" out="$OUTPUT_FOLDER/${BASENAME}.unmatched.fq" outm="$OUTPUT_FOLDER/${BASENAME}.matched.fq" ref="$OUTPUT_FOLDER/${BASENAME}.unique.kmer.fasta" k=21 hdist=1 stats="$OUTPUT_FOLDER/${BASENAME}_stats.txt" > /dev/null 2>&1

# Assemble unique reads with SPAdes
echo "Assembling unique reads..."
$SPADES -s "$OUTPUT_FOLDER/${BASENAME}.matched.fq" -o "$OUTPUT_FOLDER/assembly-${BASENAME}" --phred-offset 33 --threads "$THREADS" > /dev/null 2>&1

# Organize and move intermediate files
mkdir "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.matched.fq" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.unmatched.fq" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.unique.kmer.fasta" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.kmer.sorted.tsv" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.kmer.tsv" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.kmer" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.unmapped.trimmed.fastq" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}-unmapped.fastq" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}_stats.txt" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/assembly-${BASENAME}/contigs.fasta" "$OUTPUT_FOLDER/${BASENAME}.unique.fasta"
mv "$OUTPUT_FOLDER/assembly-${BASENAME}/" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}-unmapped-nowolbachia.bam" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"

echo "Run completed. Results are in $OUTPUT_FOLDER."
