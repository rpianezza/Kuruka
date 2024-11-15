#!/bin/bash

# Check if required arguments are provided
if [ "$#" -lt 3 ]; then
    echo "Usage: $0 <fastq> <output_folder> <threads> [--min_kmer_n <min_kmer_n>]"
    exit 1
fi

# Command-line arguments
FASTQ="$1"
OUTPUT_FOLDER="$2"
THREADS="$3"
MIN_KMER_N=100  # Default minimum k-mer frequency

# Check for optional arguments
for i in "$@"; do
    case $i in
        --min_kmer_n)
            MIN_KMER_N="${!#}"
            shift # past argument and value
            ;;
        *)
            # unknown option
            ;;
    esac
done

# Paths to tools: Jellyfish and bbduk.sh
JELLYFISH="jellyfish"
BBDUK="bbduk.sh"

# Create output folder if it doesn't exist
mkdir -p "$OUTPUT_FOLDER"

# Function to handle gzipped FASTQ files
function decompress_if_needed() {
    local fastq_file="$1"
    if [[ "$fastq_file" == *.gz ]]; then
        gunzip "$fastq_file"
        echo "${fastq_file%.gz}"
    else
        echo "$fastq_file"
    fi
}

# Decompress input FASTQ file if needed
FASTQ_DECOMPRESSED=$(decompress_if_needed "$FASTQ")

# Extract base filename without extensions (.fastq, .fq, .fastq.gz, or .fq.gz)
BASENAME=$(basename "$FASTQ_DECOMPRESSED" | sed -E 's/\.(fastq|fq)$//')

# Step 1: Trim reads (remove low quality, adapters, etc.) using bbduk.sh
echo "Trimming reads from $FASTQ_DECOMPRESSED..."
$BBDUK in="$FASTQ_DECOMPRESSED" out="$OUTPUT_FOLDER/${BASENAME}.trimmed.fastq" qtrim=rl trimq=20 minlength=50 > /dev/null 2>&1

# Step 2: Count kmers with Jellyfish for the trimmed FASTQ file
echo "Counting kmers in $OUTPUT_FOLDER/${BASENAME}.trimmed.fastq..."
$JELLYFISH count -m 21 -s 100M -t "$THREADS" -C "$OUTPUT_FOLDER/${BASENAME}.trimmed.fastq" -o "$OUTPUT_FOLDER/${BASENAME}.kmer"

# Step 3: Dump kmer counts to TSV format with min and max thresholds
echo "Dumping kmers to TSV file with min count $MIN_KMER_N and max count $MAX_KMER_N..."
$JELLYFISH dump -c -t -L "$MIN_KMER_N" "$OUTPUT_FOLDER/${BASENAME}.kmer" > "$OUTPUT_FOLDER/${BASENAME}.kmer.tsv"
awk '{print $1}' "$OUTPUT_FOLDER/${BASENAME}.kmer.tsv" | sort > "$OUTPUT_FOLDER/${BASENAME}.kmer.sorted.tsv"

# Organize and move intermediate files
mkdir -p "$OUTPUT_FOLDER/${BASENAME}-intermediate"
mv "$OUTPUT_FOLDER/${BASENAME}.trimmed.fastq" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"
mv "$OUTPUT_FOLDER/${BASENAME}.kmer" "$OUTPUT_FOLDER/${BASENAME}-intermediate/"

echo "Run completed. Kmer file is located at $OUTPUT_FOLDER/${BASENAME}.kmer.sorted.tsv."
