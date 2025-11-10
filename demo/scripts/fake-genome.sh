#!/usr/bin/env bash

GENOME_SIZE=1000000
GENOME_FILE=fake_genome.fasta

echo ">fake_genome" > $GENOME_FILE
LC_ALL=C tr -dc 'ACGT' < /dev/urandom | fold -w 80 | head -c $GENOME_SIZE >> $GENOME_FILE

