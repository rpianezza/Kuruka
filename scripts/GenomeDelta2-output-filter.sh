#!/bin/bash

# Check if required arguments are provided
if [ "$#" -lt 4 ]; then
    echo "Usage: $0 <input_folder> <protein_library> <output_folder> <similarity_threshold> <length_threshold> <threads>"
    exit 1
fi

# Command-line arguments
INPUT_FOLDER="$1"
PROTEIN_LIBRARY="$2"
OUTPUT_FOLDER="$3"
SIMILARITY_THRESHOLD="$4"
LENGTH_THRESHOLD="$5"
THREADS="$6"

# Step 1: Concatenate all FASTA files in the input folder
echo "Concatenating all FASTA files in $INPUT_FOLDER..."
mkdir -p "$OUTPUT_FOLDER"  # Ensure output folder exists
cat "$INPUT_FOLDER"/*.fasta > "$OUTPUT_FOLDER/concatenated_sequences.fasta"

# Step 2: Perform BLASTx against the given protein library
BLAST_OUTPUT="$OUTPUT_FOLDER/blast.tsv"
echo "Running BLASTx..."
blastx -query "$OUTPUT_FOLDER/concatenated_sequences.fasta" \
       -db "$PROTEIN_LIBRARY" \
       -num_threads "$THREADS" \
       -outfmt "6 qseqid pident length" \
       -out "$BLAST_OUTPUT"

# Step 3: Filter matches based on similarity and length thresholds
FILTERED_CONTIGS="$OUTPUT_FOLDER/TE-contigs.txt"
echo "Filtering matches with similarity > $SIMILARITY_THRESHOLD and length > $LENGTH_THRESHOLD..."
awk -v sim="$SIMILARITY_THRESHOLD" -v len="$LENGTH_THRESHOLD" \
    '$2 > sim && $3 > len {print $1}' "$BLAST_OUTPUT" | sort | uniq > "$FILTERED_CONTIGS"

# Step 4: Process FASTA files using external Python scripts
DEFRAG_FASTA="$OUTPUT_FOLDER/concatenated_sequences.defrag.fasta"
FINAL_FASTA="$OUTPUT_FOLDER/TE-contigs.fasta"

echo "Defragmenting FASTA sequences..."
python /Volumes/Storage/GitHub/Utilities/defragment-fasta.py \
       "$OUTPUT_FOLDER/concatenated_sequences.fasta" \
       "$DEFRAG_FASTA"

echo "Filtering FASTA sequences..."
python /Volumes/Storage/GitHub/Utilities/filter-fasta.py \
       "$DEFRAG_FASTA" \
       "$FILTERED_CONTIGS" \
       "$FINAL_FASTA"

echo "Process complete. Filtered FASTA saved to $FINAL_FASTA."
