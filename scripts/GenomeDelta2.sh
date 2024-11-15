#!/bin/bash

# Check if required arguments are provided
if [ "$#" -lt 5 ]; then
    echo "Usage: $0 <fastq> <reference_genome> <bacterial_genome> <output_folder> <threads> [--identity_threshold <identity_threshold>] [--alignment_length_threshold <alignment_length_threshold>]"
    exit 1
fi

# Command-line arguments
FASTQ="$1"
REFERENCE_GENOME="$2"
BACTERIAL_GENOME="$3"
OUTPUT_FOLDER="$4"
THREADS="$5"
IDENTITY_THRESHOLD=0  # Default to skip low-identity recovery
ALIGNMENT_LENGTH_THRESHOLD=0

# Parse optional arguments
shift 5  # Shift past the positional arguments
while [[ $# -gt 0 ]]; do
    case "$1" in
        --identity_threshold)
            IDENTITY_THRESHOLD="$2"
            shift 2
            ;;
        --alignment_length_threshold)
            ALIGNMENT_LENGTH_THRESHOLD="$2"
            shift 2
            ;;
        *)
            echo "Unknown option: $1"
            exit 1
            ;;
    esac
done

# Check if essential tools are installed
for cmd in bwa samtools spades.py python3; do
    if ! command -v "$cmd" &> /dev/null; then
        echo "Error: $cmd is not installed."
        exit 1
    fi
done

JELLYFISH="jellyfish"
SPADES="spades.py"
BBDUK="bbduk.sh"
BWA="bwa"
SAMTOOLS="samtools"
PYTHON_SCRIPT="/Volumes/Storage/mining/GenomeDelta2.0/scripts/badmapped-finder.py"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER" || { echo "Failed to create output folder: $OUTPUT_FOLDER"; exit 1; }

# Extract base filename without extensions (.fastq, .fq, .fastq.gz, or .fq.gz)
BASENAME=$(basename "$FASTQ" | sed -E 's/\.(fastq|fq)(\.gz)?$//')

# Step 1: Map reads to the reference genome and extract unmapped reads
echo "Mapping $FASTQ to $REFERENCE_GENOME"

# Index the reference genome if not already indexed
if [ ! -f "${REFERENCE_GENOME}.bwt" ]; then
    $BWA index "$REFERENCE_GENOME" || { echo "BWA indexing failed for $REFERENCE_GENOME"; exit 1; }
fi

if [ ! -f "${BACTERIAL_GENOME}.bwt" ]; then
    $BWA index "$BACTERIAL_GENOME" || { echo "BWA indexing failed for $BACTERIAL_GENOME"; exit 1; }
fi

# Run BWA-MEM and save the SAM file
$BWA mem -t "$THREADS" "$REFERENCE_GENOME" "$FASTQ" > "$OUTPUT_FOLDER/${BASENAME}.sam"

# Convert SAM to BAM file
echo "Extracting unmapped reads..."
$SAMTOOLS view -@ "$THREADS" -b -f 4 "$OUTPUT_FOLDER/${BASENAME}.sam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam"

# Step 2: Extract low-identity reads based on thresholds
echo "Recovering reads badly mapped..."
# Extract reads based on identity threshold and alignment length
$SAMTOOLS view -h "$OUTPUT_FOLDER/${BASENAME}.sam" | \
python3 "$PYTHON_SCRIPT" --identity_threshold "$IDENTITY_THRESHOLD" --alignment_length_threshold "$ALIGNMENT_LENGTH_THRESHOLD" | \
$SAMTOOLS view -b - > "$OUTPUT_FOLDER/${BASENAME}-low_identity.bam" || { echo "Low-identity filtering failed"; exit 1; }

# Merge unmapped and low-identity BAM files
$SAMTOOLS merge -f "$OUTPUT_FOLDER/${BASENAME}-combined.bam" \
    "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" \
    "$OUTPUT_FOLDER/${BASENAME}-low_identity.bam" || { echo "samtools merge failed"; exit 1; }

# Convert BAM file back to FASTQ format
$SAMTOOLS fastq "$OUTPUT_FOLDER/${BASENAME}-combined.bam" > "$OUTPUT_FOLDER/${BASENAME}-combined.fastq" || { echo "samtools fastq failed"; exit 1; }

# Step 3: Remove contamination from the unmapped reads
echo "Removing contamination from $OUTPUT_FOLDER/${BASENAME}-combined.fastq..."
$BWA mem -t "$THREADS" "$BACTERIAL_GENOME" "$OUTPUT_FOLDER/${BASENAME}-combined.fastq" | \
$SAMTOOLS view -b -f 4 -o "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.bam" - || { echo "Contamination removal failed"; exit 1; }

$SAMTOOLS fastq "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.bam" > "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.fastq" || { echo "samtools fastq failed"; exit 1; }

# Step 4: Assemble unmapped reads with SPAdes
echo "Assembling unique reads..."
$SPADES -s "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.fastq" -o "$OUTPUT_FOLDER/assembly-${BASENAME}" \
    --phred-offset 33 --threads "$THREADS" > /dev/null 2>&1

# Cleanup and organize intermediate files
rm "$OUTPUT_FOLDER/${BASENAME}-combined.bam"
rm "$OUTPUT_FOLDER/${BASENAME}-combined.fastq"
rm "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.bam"
mv "$OUTPUT_FOLDER/assembly-${BASENAME}/contigs.fasta" "$OUTPUT_FOLDER/${BASENAME}-unique.fasta"

mkdir "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/${BASENAME}.sam" "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/${BASENAME}-unmapped.bam" "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/${BASENAME}-low_identity.bam" "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/${BASENAME}-unmapped-clean.fastq" "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/assembly-${BASENAME}" "$OUTPUT_FOLDER/${BASENAME}-intermediate"

echo "Run completed. Results are in $OUTPUT_FOLDER."
