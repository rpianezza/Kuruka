#!/bin/bash

# Check if required arguments are provided
if [ "$#" -lt 5 ]; then
    echo "Usage: $0 <fastq> <kmer_set> <reference_genome> <bacterial_genome> <output_folder> <threads> [--min_kmer_n <min_kmer_n>] [--max_kmer_n <max_kmer_n>]"
    exit 1
fi

# Command-line arguments
FASTQ="$1"
KMER_SET="$2"
REFERENCE_GENOME="$3"
BACTERIAL_GENOME="$4"
OUTPUT_FOLDER="$5"
THREADS="$6"
KEEP_UNZIPPED=false
MIN_KMER_N=100  # Default minimum k-mer frequency

# Check for optional arguments
for i in "$@"; do
    case $i in
        --min_kmer_n)
            MIN_KMER_N="${!#}"
            shift # past argument and value
            ;;
        --max_kmer_n)
            MAX_KMER_N="${!#}"
            shift # past argument and value
            ;;
        *)
            # unknown option
            ;;
    esac
done

# Paths to tools: Jellyfish, SPAdes, bbduk.sh, and BWA
JELLYFISH="jellyfish"
SPADES="spades.py"
BBDUK="./bbmap/bbduk.sh"
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

# Run BWA-MEM and filter unmapped reads
$BWA mem -t "$THREADS" "$REFERENCE_GENOME" "$FASTQ" | \
    samtools view -b -f 4 -o "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" -

# Convert BAM file back to FASTQ format
samtools fastq "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped.fastq"

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