import argparse

# Parse command-line arguments
parser = argparse.ArgumentParser(description="Filter FASTA file.")
parser.add_argument("fasta", help="Path to fasta file")
parser.add_argument("output", help="Path to the output file")
args = parser.parse_args()

def filter(fasta, out):
    with open(fasta, 'r') as fasta_file, open(out, 'w') as output_file:
        for i, line in enumerate(fasta_file):
            line = line.strip()
            if line.startswith(">"):
                if i>0:
                    output_file.write("\n")
                output_file.write(line + "\n")
            else:
                output_file.write(line)

filter(args.fasta, args.output)