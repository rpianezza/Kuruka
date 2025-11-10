import argparse
import sys
import re

def parse_cigar(cigar):
    """Parse CIGAR string to calculate the length of the alignment."""
    alignment_length = 0
    for length, operation in re.findall(r'(\d+)([A-Z])', cigar):
        length = int(length)
        if operation in ['M', 'I', 'N']:  # Only these contribute to alignment length
            alignment_length += length
    return alignment_length

def parse_md(md_tag):
    """Parse MD tag to count mismatches."""
    if not md_tag:  # Handle missing MD tag
        return 0
    mismatches = len(re.findall(r'[A-Z]', md_tag))  # Count mismatch bases
    return mismatches

def process_sam_line(sam_line, identity_threshold, alignment_length_threshold):
    """Process a SAM line to filter out low-identity or misaligned reads."""
    fields = sam_line.split("\t")
    
    # Extract relevant fields
    cigar = fields[5]
    md_tag = next((field.split(":")[2] for field in fields if field.startswith("MD:Z:")), None)
    if not md_tag:  # Skip lines without MD tags
        return False
    
    read_length = len(fields[9])  # Read sequence is in the 10th column
    
    # Compute alignment length and mismatch count
    alignment_length = parse_cigar(cigar)
    mismatches = parse_md(md_tag)
    
    # Compute percentage of mismatches relative to alignment length
    mismatch_prop = (mismatches / alignment_length) if alignment_length > 0 else 0

    # Filter based on thresholds: select reads with MANY mismatches
    if alignment_length / read_length > alignment_length_threshold and mismatch_prop > identity_threshold:
        return True
    else:
        return False

def main():
    parser = argparse.ArgumentParser(description="Filter low-identity reads based on thresholds.")
    parser.add_argument("--identity_threshold", type=float, required=True, help="Mismatch percentage threshold.")
    parser.add_argument("--alignment_length_threshold", type=float, required=True, help="Alignment length threshold.")
    
    args = parser.parse_args()

    for sam_line in sys.stdin:
        if sam_line.startswith("@"):  # Skip header lines
            print(sam_line.strip())
            continue
        else:
            filtered_line = process_sam_line(sam_line, args.identity_threshold, args.alignment_length_threshold)
            if filtered_line:
                print(sam_line.strip())

if __name__ == "__main__":
    main()
