# README: Find transposon families absent from a reference genome using short reads

This repository contains the code to detect transposable element families absent from a reference genome, but present in a short-reads dataset.

## System requirements

The software has been tested on Linux (Ubuntu 22.04 LTS) and macOS Ventura 13.3 and should be compatible with most Unix-based systems, including high-performance computing clusters. The workflow requires Python version 3.9 or higher and a Bash shell (version 5.0 or higher).

The pipeline depends on standard bioinformatics software, including bwa mem (v0.7.17-r1188) for short-read mapping, samtools (v1.13) for extracting unmapped reads, SPAdes (v3.13.1) for de novo assembly.

Python dependencies include Biopython, Pandas, NumPy, Matplotlib, SciPy, and argparse.

No non-standard hardware is required. The workflow runs on a standard desktop or laptop computer with at least 16 GB of RAM. For very large datasets (e.g., population-level short-read collections), an HPC or cloud computing environment is recommended. The software does not require GPU acceleration.

## Installation guide

To install the software, first clone this repository from GitHub and move into the project directory. Create a conda environment with the provided yml file, then activate it.

"conda env create -f kuruka-env.yml"
"conda activate kuruka-env"

Installation on a typical desktop computer with a stable internet connection takes approximately 10 to 15 minutes.

## Run the demo

A demonstration dataset is provided to illustrate the core functions of the pipeline. To run the demo, navigate to the demo directory and execute the run_demo.sh script. This demo performs short-read mapping, extraction of divergent unmapped reads, de novo assembly.

Example call:
"gunzip short-reads.fastq"
"mkdir output"
"bash run-demo.sh short_reads.fastq genomes/reference-genome.fasta genomes/bacteria.fasta output 10"

Upon successful completion, the demo produces two main outputs:
-A folder with all the intermediate files.
-A fasta file containing the assembled contigs not found in the reference genome (e.g. the TEs).  This file should contain only one assembled contig, with sequence and length similar to the Kuruka consensus sequence (provided in the demo to check).


The demo runs in approximately 1 minute on a standard computer with eight CPU cores and 16 GB of RAM.
