#!/bin/bash

# Bash script to filter all FASTA files, concatenate the results, and run CD-HIT
# Usage: ./filter_and_cdhit.sh --input_folder INPUT_FOLDER --output_folder OUTPUT_FOLDER --min MIN_LENGTH --max MAX_LENGTH --cov MIN_COV --output_prefix OUTPUT_PREFIX --identity IDENTITY

# Function to display usage
usage() {
    echo "Usage: $0 --input_folder INPUT_FOLDER --output_folder OUTPUT_FOLDER --min MIN_LENGTH --max MAX_LENGTH --cov MIN_COV --output_prefix OUTPUT_PREFIX --identity IDENTITY"
    exit 1
}

# Parse arguments using argparse-like syntax
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --input_folder) input_folder="$2"; shift ;;
        --output_folder) output_folder="$2"; shift ;;
        --min) min_length="$2"; shift ;;
        --max) max_length="$2"; shift ;;
        --cov) min_cov="$2"; shift ;;
        --output_prefix) output_prefix="$2"; shift ;;
        --identity) identity="$2"; shift ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

# Check required arguments
if [[ -z "$input_folder" || -z "$output_folder" || -z "$min_length" || -z "$max_length" || -z "$min_cov" || -z "$output_prefix" || -z "$identity" ]]; then
    echo "Missing required arguments."
    usage
fi

# Create the output folder if it doesn't exist
mkdir -p "$output_folder"

# Step 1: Filter all FASTA files
echo "Filtering FASTA files..."
for fasta_file in "$input_folder"/*.fasta; do
    if [[ -f "$fasta_file" ]]; then
        # Get the base name of the file
        base_name=$(basename "$fasta_file")
        # Define the output file path
        output_file="$output_folder/$base_name"
        # Run the Python script to filter the FASTA file
        python3 fasta2goodcandidates.py "$fasta_file" --min "$min_length" --max "$max_length" --cov "$min_cov" > "$output_file"
        echo "Filtered $fasta_file -> $output_file"
    fi
done

# Step 2: Concatenate all filtered FASTA files
echo "Concatenating all filtered FASTA files..."
concatenated_file="$output_folder/${output_prefix}_combined.fasta"
cat "$output_folder"/*.fasta > "$concatenated_file"
echo "All files concatenated into $concatenated_file"

# Step 3: Run CD-HIT on the concatenated file
echo "Running CD-HIT with identity $identity..."
cdhit_output="$output_folder/${output_prefix}_cdhit"
cd-hit -i "$concatenated_file" -o "$cdhit_output" -c "$identity" -n 5 -d 0 -T 4 -M 16000
echo "CD-HIT clustering complete."
echo "Output files:"
echo " - Clusters: ${cdhit_output}.clstr"
echo " - Filtered sequences: ${cdhit_output}"
