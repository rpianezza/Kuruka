import os
import argparse
from Bio import SeqIO
from Bio.Blast.Applications import NcbiblastnCommandline
from pathlib import Path

def run_blast(query_file, subject_file, output_file, identity, min_length):
    """Run BLAST with specific criteria."""
    blastn_cline = NcbiblastnCommandline(
        query=query_file,
        subject=subject_file,
        outfmt=6,
        out=output_file,
        perc_identity=identity
    )
    stdout, stderr = blastn_cline()

def extract_cluster(blast_results, input_sequences, min_length, query_id):
    """Parse BLAST results and extract matching sequences, including the query sequence."""
    matches = {query_id}  # Start with the query sequence in the set of matches
    with open(blast_results, "r") as f:
        for line in f:
            cols = line.strip().split("\t")
            query, subject, length = cols[0], cols[1], int(cols[3])
            if length >= min_length:
                matches.add(subject)  # Add matching subject sequences
    return [seq for seq in input_sequences if seq.id in matches]

def write_sequences(sequences, output_file):
    """Write a list of sequences to a FASTA file."""
    with open(output_file, "w") as f:
        SeqIO.write(sequences, f, "fasta")

def main(args):
    input_fasta = args.input_fasta
    output_folder = Path(args.output_folder)
    output_folder.mkdir(exist_ok=True, parents=True)

    # Load all sequences
    sequences = list(SeqIO.parse(input_fasta, "fasta"))
    cluster_count = 1

    while sequences:
        # Step 1: Find the longest sequence
        sequences.sort(key=lambda seq: len(seq), reverse=True)
        longest_seq = sequences[0]
        query_file = output_folder / "longest_sequence.fasta"
        write_sequences([longest_seq], query_file)

        # Step 2: Create a BLAST database for the remaining sequences
        remaining_file = output_folder / "remaining_sequences.fasta"
        write_sequences(sequences[1:], remaining_file)

        blast_results = output_folder / "blast_results.txt"
        run_blast(query_file, remaining_file, blast_results, args.blast_identity, args.min_match_len)

        # Step 3: Extract matching sequences
        query_id = longest_seq.id
        cluster_sequences = extract_cluster(blast_results, sequences, args.min_match_len, query_id)
        if not cluster_sequences:
            print("Empty cluster")
            break

        cluster_file = output_folder / f"cluster_n{cluster_count}-{len(cluster_sequences)}seqs.fasta"
        write_sequences(cluster_sequences, cluster_file)
        print(f"Cluster {cluster_count} with {len(cluster_sequences)} sequences written to {cluster_file}")

        # Step 4: Remove clustered sequences
        clustered_ids = {seq.id for seq in cluster_sequences}
        sequences = [seq for seq in sequences if seq.id not in clustered_ids]
        cluster_count += 1

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Cluster sequences using BLAST.")
    parser.add_argument("--input_fasta", required=True, help="Input FASTA file")
    parser.add_argument("--output_folder", required=True, help="Output folder for clusters")
    parser.add_argument("--blast_identity", type=float, required=True, help="Minimum percentage identity for BLAST")
    parser.add_argument("--min_match_len", type=int, required=True, help="Minimum match length for clustering")
    args = parser.parse_args()

    main(args)
