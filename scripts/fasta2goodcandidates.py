import argparse
import os

def parse_fasta(file_path, min_length, max_length, min_cov):
    """
    Parses and filters a FASTA file based on length and coverage.

    Args:
        file_path (str): Path to the FASTA file.
        min_length (int): Minimum sequence length.
        max_length (int): Maximum sequence length.
        min_cov (float): Minimum coverage.

    Yields:
        str: Filtered header and sequence.
    """
    base_name = os.path.basename(file_path)
    with open(file_path, 'r') as fasta_file:
        header = None
        sequence = []
        for line in fasta_file:
            line = line.strip()
            if line.startswith('>'):  # Header line
                # Process previous record
                if header and sequence:
                    yield from filter_record(header, ''.join(sequence), base_name, min_length, max_length, min_cov)
                # Start new record
                header = line
                sequence = []
            else:
                sequence.append(line)

        # Process last record
        if header and sequence:
            yield from filter_record(header, ''.join(sequence), base_name, min_length, max_length, min_cov)

def filter_record(header, sequence, base_name, min_length, max_length, min_cov):
    """
    Filters a single FASTA record based on length and coverage.

    Args:
        header (str): FASTA header.
        sequence (str): FASTA sequence.
        base_name (str): Basename of the file.
        min_length (int): Minimum sequence length.
        max_length (int): Maximum sequence length.
        min_cov (float): Minimum coverage.

    Yields:
        str: Filtered header and sequence.
    """
    try:
        parts = header.split('_')
        length = int(parts[3])
        cov = float(parts[-1])
        if min_length <= length <= max_length and cov >= min_cov:
            new_header = f">{base_name}_{header[1:]}"
            yield f"{new_header}\n{sequence}"
    except (ValueError, IndexError):
        print(f"Error processing header: {header}")

def main():
    parser = argparse.ArgumentParser(description="Filter a FASTA file based on length and coverage.")
    parser.add_argument("fasta_file", help="Input FASTA file")
    parser.add_argument("--min", type=int, required=True, help="Minimum sequence length")
    parser.add_argument("--max", type=int, required=True, help="Maximum sequence length")
    parser.add_argument("--cov", type=float, required=True, help="Minimum coverage")
    args = parser.parse_args()

    fasta_file = args.fasta_file
    min_length = args.min
    max_length = args.max
    min_cov = args.cov

    for filtered_record in parse_fasta(fasta_file, min_length, max_length, min_cov):
        print(filtered_record)

if __name__ == "__main__":
    main()
