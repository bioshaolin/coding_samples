#!/bin/bash -l

#source env_dir/comparative_analysis_phylo_env.sh
#source env_dir/pangenome_env.sh
module load muscle/3.8.425
module load FastTree/2.1.8


cd /scicomp/home/opw9/bot_run_dir/functional_marker_dir/metabolism_dir/accAD_dir

muscle -in 3_accAD_all.faa -out 4_accAD_alignment.faa

FastTree -pseudo 4_accAD_alignment.faa > accAD.nw
