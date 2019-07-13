#!/bin/bash -l

#source env_dir/comparative_analysis_phylo_env.sh
#source env_dir/pangenome_env.sh
module load muscle/3.8.425
module load FastTree/2.1.8


cd /scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/eutT_dir

muscle -in 4_eutT_all.faa -out 4_eutT_alignment.faa

FastTree -pseudo 4_eutT_alignment.faa > eutT.nw
