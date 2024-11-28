#!/bin/bash

# Usage: bash GenomeDelta2-output-filter.sh --input_folder INPUT_FOLDER --output_folder OUTPUT_FOLDER --min MIN_LENGTH --max MAX_LENGTH --cov MIN_COV --output_prefix OUTPUT_PREFIX --blast_identity BLAST_IDENTITY --min_match_len MIN_MATCH_LEN

usage() {
    echo "Usage: $0 --input_folder INPUT_FOLDER --output_folder OUTPUT_FOLDER --min MIN_LENGTH --max MAX_LENGTH --cov MIN_COV --output_prefix OUTPUT_PREFIX --blast_identity BLAST_IDENTITY --min_match_len MIN_MATCH_LEN"
    exit 1
}

# Parse arguments
while [[ "$#" -gt 0 ]]; do
    case $1 in
        --input_folder) input_folder="$2"; shift ;;
        --output_folder) output_folder="$2"; shift ;;
        --min) min_length="$2"; shift ;;
        --max) max_length="$2"; shift ;;
        --cov) min_cov="$2"; shift ;;
        --output_prefix) output_prefix="$2"; shift ;;
        --blast_identity) blast_identity="$2"; shift ;;
        --min_match_len) min_match_len="$2"; shift ;;
        *) echo "Unknown parameter: $1"; usage ;;
    esac
    shift
done

# Check required arguments
if [[ -z "$input_folder" || -z "$output_folder" || -z "$min_length" || -z "$max_length" || -z "$min_cov" || -z "$output_prefix" || -z "$blast_identity" || -z "$min_match_len" ]]; then
    echo "Missing required arguments."
    usage
fi

mkdir -p "$output_folder"
mkdir -p "$output_folder/candidates"
mkdir -p "$output_folder/clusters"
mkdir -p "$output_folder/clusters/rare"
mkdir -p "$output_folder/clusters/common"

# Step 1: Filter and concatenate (from previous script)
echo "Filtering FASTA files and concatenating..."
for fasta_file in "$input_folder"/*.fasta; do
    base_name=$(basename "$fasta_file")
    output_file="$output_folder/candidates/$base_name"
    python3 fasta2goodcandidates.py "$fasta_file" --min "$min_length" --max "$max_length" --cov "$min_cov" > "$output_file"
done
concatenated_file="$output_folder/${output_prefix}_combined.fasta"
cat "$output_folder"/*.fasta > "$concatenated_file"

# Step 2: Perform clustering based on BLAST
echo "Clustering sequences using BLAST..."
python3 clustering.py \
    --input_fasta "$concatenated_file" \
    --output_folder "$output_folder/clusters" \
    --blast_identity "$blast_identity" \
    --min_match_len "$min_match_len"

echo "Organizing clusters into 'rare' and 'common' folders..."
for cluster_file in "$output_folder/clusters"/*.fasta; do
    if [[ -f "$cluster_file" ]]; then
        sequence_count=$(grep -c "^>" "$cluster_file") # Count sequences in the FASTA file
        if [[ "$sequence_count" -gt 5 ]]; then
            mv "$cluster_file" "$output_folder/clusters/common/"
        else
            mv "$cluster_file" "$output_folder/clusters/rare/"
        fi
    fi
done

# Step: Extract the first FASTA entry from each "common" cluster and concatenate them with the cluster name
echo "Extracting the first FASTA entry from each common cluster and adding the cluster name..."

# Define the output file where the concatenated sequences will be stored
concatenated_file="$output_folder/representative-candidates-n5.fasta"
> "$concatenated_file"  # Create or clear the output file

# Loop over each cluster file in the "common" folder
for cluster_file in "$output_folder/clusters/common"/*.fasta; do
    if [[ -f "$cluster_file" ]]; then
        # Extract the cluster name from the filename (without the extension)
        cluster_name=$(basename "$cluster_file" .fasta)
        
        # Extract the first FASTA entry (header + sequence) and add the cluster name to the header
        awk -v cluster_name="$cluster_name" 'BEGIN {in_sequence=0} 
             /^>/ {if (in_sequence == 1) exit; print ">" cluster_name "_" substr($0,2); in_sequence=1; next} 
             in_sequence {print}' "$cluster_file" >> "$concatenated_file"
    fi
done

echo "All first entries with cluster names concatenated into $concatenated_file"

blastx -query "$concatenated_file" -subject ../transposons-proteins/transposons-clean.fasta -outfmt 6 > "$output_folder/blast-TEproteins.tsv"

cat "$output_folder/blast-TEproteins.tsv" | \
awk '$3 > 35 && $4 > 100 {print $1}' | \
sort | uniq > "$output_folder/TE-candidates.txt"

python defragment-fasta.py "$concatenated_file" "$concatenated_file.defrag"
python filter-fasta.py "$concatenated_file.defrag" "$output_folder/TE-candidates.txt" "$output_folder/TE-candidates.fasta"