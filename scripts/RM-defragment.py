import argparse
import pandas as pd
import re

def parse_repeatmasker_line(line):
    # Split using regex to handle multiple spaces
    tokens = re.split(r'\s+', line.strip())
    return {
        'SWscore': int(tokens[0]),
        'pdiv': float(tokens[1]),
        'pdel': float(tokens[2]),
        'pins': float(tokens[3]),
        'contig': tokens[4],
        'qstart': int(tokens[5]),
        'qend': int(tokens[6]),
        'qleft': tokens[7],
        'strand': tokens[8],
        'te': tokens[9],
        'class': tokens[10],
        'position_in_repeat_left': tokens[11],
        'position_in_repeat_begin': tokens[12],
        'position_in_repeat_end': tokens[13]
    }

def read_repeatmasker_file(filename):
    entries = []
    with open(filename) as f:
        for line in f:
            if line.strip() == "":
                continue
            parsed = parse_repeatmasker_line(line)
            if parsed:
                entries.append(parsed)
    return pd.DataFrame(entries)

def merge_fragments(df, max_distance):
    merged_entries = []
    grouped = df.sort_values(['contig', 'qstart']).groupby(['contig', 'te', 'strand'])

    for (contig, te, strand), group in grouped:
        current = group.iloc[0].copy()
        total_len = current['qend'] - current['qstart'] + 1
        weighted_pdiv = current['pdiv'] * total_len

        for i in range(1, len(group)):
            row = group.iloc[i]
            distance = row['qstart'] - current['qend']
            if distance <= max_distance:
                # Merge
                frag_len = row['qend'] - row['qstart'] + 1
                current['qend'] = max(current['qend'], row['qend'])
                total_len += frag_len
                weighted_pdiv += row['pdiv'] * frag_len
            else:
                # Finalize previous
                current['pdiv'] = weighted_pdiv / total_len
                merged_entries.append(current.copy())
                # Start new
                current = row.copy()
                total_len = current['qend'] - current['qstart'] + 1
                weighted_pdiv = current['pdiv'] * total_len

        current['pdiv'] = weighted_pdiv / total_len
        merged_entries.append(current.copy())

    return pd.DataFrame(merged_entries)

def write_output(df, filename):
    with open(filename, 'w') as f:
        for _, row in df.iterrows():
            f.write(f"{row['SWscore']:>5} {row['pdiv']:>5.2f} {row['pdel']:>5.2f} {row['pins']:>5.2f}  "
                    f"{row['contig']:>20} {row['qstart']:>8} {row['qend']:>8} {row['qleft']:>8} "
                    f"{row['strand']:>2} {row['te']:>15} {row['class']:>12} {row['qleft']:>8} "
                    f"{row['qstart']:>8} {row['qend']:>8}\n")

def main():
    parser = argparse.ArgumentParser(description="Defragment RepeatMasker output")
    parser.add_argument("input", help="Input RepeatMasker-like file")
    parser.add_argument("output", help="Output defragmented file")
    parser.add_argument("--d", type=int, default=100, help="Max distance to merge fragments")
    args = parser.parse_args()

    df = read_repeatmasker_file(args.input)
    merged = merge_fragments(df, args.d)
    write_output(merged, args.output)

if __name__ == "__main__":
    main()
