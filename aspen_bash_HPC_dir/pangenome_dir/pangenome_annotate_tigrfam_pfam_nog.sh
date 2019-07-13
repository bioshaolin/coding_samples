#!/bin/bash -l

source env_dir/pangenome_env.sh
module load perl/5.26.1
module load Python/2.7.3
module load prodigal/2.63
module load hmmer/3.1b2

python aspen_bash_dir/pangenome_dir/pangenome_annotate_tigrfam.py
python aspen_bash_dir/pangenome_dir/pangenome_annotate_pfam.py
python aspen_bash_dir/pangenome_dir/pangenome_annotate_nog.py
