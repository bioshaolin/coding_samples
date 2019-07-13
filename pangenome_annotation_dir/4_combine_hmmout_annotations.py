import os
import sys
import subprocess
import numpy as np
import re
import glob
import shlex
import operator
from collections import defaultdict
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import generic_alphabet

tigr_abbrv = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/pangenome_abbrv_tigr.txt", "r")

pfam_abbrv = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/pangenome_abbrv_pfam.txt", "r")

nog_abbrv = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/pangenome_abbrv_nog.txt", "r")

pangenome = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/bot_rep_pangenome.faa", "r")

final_combine_tigr = defaultdict(lambda:"tig_NA" + "\t" + "NA" + "\t" + "tig_NA")
final_combine_pfam = defaultdict(lambda:"pfam_NA" + "\t" + "NA" +  "\t" + "pfam_NA")
final_combine_nog = defaultdict(lambda:"nog_NA" + "\t" + "NA" + "\t" + "nog_NA")

output = open("complete_reps_supplemental_material_with_noise.txt", "w")

for lines in pfam_abbrv.readlines():
	line = lines.rstrip()
	tabs_p = line.split("\t")
	prot_id_p = tabs_p[0]
	bit_p = tabs_p[1]
	name_p = tabs_p[2]
	pfam_line_entry = bit_p + "\t" + name_p

	final_combine_pfam[prot_id_p] = pfam_line_entry


for lines in tigr_abbrv.readlines():
	line = lines.rstrip()
	tabs = line.split("\t")
	prot_id = tabs[0]
	bit = tabs[1]
	tigr_id = tabs[2]
	name = tabs[3]
	newline = tabs[1] + "\t" + tabs[2] + "\t" + tabs[3]
#	print prot_id
	final_combine_tigr[prot_id] = newline


for lines in nog_abbrv.readlines():
	line = lines.rstrip()
	tabs = line.split("\t")
	prot_id_n = tabs[0]
	bit_n = tabs[1]
	nog_id = tabs[2]
	name = tabs[3]
	newline_n = tabs[1] + "\t" + tabs[2] + "\t" + tabs[3]

	final_combine_nog[prot_id_n] = newline_n



for record in SeqIO.parse(pangenome, "fasta"):
	protein_name = record.id
	output.write(final_combine_pfam[protein_name] +"\t"+ final_combine_tigr[protein_name] +"\t"+ final_combine_nog[protein_name] + "\n")
#	output.write(final_combine_cluster[protein_name] + "\t" + final_combine_nog[protein_name] + "\n")
