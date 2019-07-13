#!/bin/bash -l

module load Python/2.7.3
module load perl/5.26.1

module load ncbi-blast+/LATEST
module load Entrez/E-utilities
module load sratoolkit/2.9.1
module load clcgenomicswb/10.1.64
module load checkm/1.0.6

cd /scicomp/home/opw9/bot_run_dir/blast_dir

blastp -query dpaL.faa -db dpaL_db -evalue 1e-50 -out eutB_comparison_dpaL.faa -outfmt 7
