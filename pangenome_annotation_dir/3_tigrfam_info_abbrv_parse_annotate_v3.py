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



pangenome = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/bot_rep_pangenome.tigr.hmmout.parsed", "r")

pangenome_p = open("/scicomp/home/opw9/bot_run_dir/nc_cutoff_run_dir/pangenome_by_noise_dir/prot_dir/bot_rep_pangenome.pfam.hmmout.parsed", "r")

db_abbrv = "/scicomp/home/opw9/hmm_universal_dir/tigrfam_dir/tigr_info_abbrv_dir"

db_abbrv_2 = "/scicomp/home/opw9/hmm_universal_dir/pfam_dir"


ids_dict = defaultdict(list)
tigr_dict = defaultdict(list)
pfam_dict = defaultdict(list)
done_dict = defaultdict(list)
bit_dict = defaultdict(float)
bit_dict = {}
prot_dict = defaultdict(list)
prot_p_dict = defaultdict(list)

###### tigr abrreviation and parse #####

dirs_2 = os.listdir(db_abbrv)
info_dict = defaultdict(list)
for filenames in dirs_2:
	if filenames.endswith(".info"):
		j = open(db_abbrv + "/" + filenames, 'r')
		output = open("pangenome_abbrv_tigr.txt", "w")
		for lines in j.readlines():
			line = lines.rstrip()
			tabs = line.split("\t")
			ids = tabs[0]
			acc = tabs[1]
			names = tabs[2]
			info_dict[acc] = names
#			print(ids_dict[ids])

for lines in pangenome.readlines():
	line = lines.rstrip()
	tabs = line.split("\t")
#	name = tabs[0]
	prot_id = tabs[0]
	tigr_id = "AC" + "  " + tabs[1]
	evalue = tabs[2]
	bit_score = float(tabs[3])
	prot_dict[prot_id] = prot_id

	if prot_id in bit_dict:
		if bit_score > bit_dict[prot_id]:
			bit_dict[prot_id] = bit_score
			tigr_dict[prot_id] = tigr_id
		else:
			pass
	else:
		bit_dict[prot_id] = bit_score
		tigr_dict[prot_id] = tigr_id

for prot_id in tigr_dict:
	tigr = tigr_dict[prot_id]
	bit = bit_dict[prot_id]
	desc = info_dict[tigr]
#	print prot_id, bit, tigr, desc

	output.write(str(prot_id) + "\t" + str(bit)+ "\t" + str(tigr) + "\t" + str(desc) + "\n")

###### pfam abrreviation and parse #####

dirs_3 = os.listdir(db_abbrv_2)
info_dict = defaultdict(list)
for filenames in dirs_3:
	if filenames.endswith(".abbrv.info"):
		j = open(db_abbrv_2 + "/" + filenames, 'r')
		output_2 = open("pangenome_abbrv_pfam.txt", "w")
		for lines in j.readlines():
			line = lines.rstrip()
			tabs = line.split("\t")
			ids_p = tabs[0]
			acc_p = tabs[1]
			info_dict[acc_p] = acc_p

for lines in pangenome_p.readlines():
	line = lines.rstrip()
	tabs = line.split("\t")
	prot_id_p = tabs[0]
	pfam_id = tabs[1]
	evalue = tabs[2]
	bit_score = float(tabs[3])
	prot_p_dict[prot_id_p] = prot_id_p

	if prot_id_p in bit_dict:
		if bit_score > bit_dict[prot_id_p]:
			bit_dict[prot_id_p] = bit_score
			pfam_dict[prot_id_p] = pfam_id
		else:
			pass
	else:
		bit_dict[prot_id_p] = bit_score
		pfam_dict[prot_id_p] = pfam_id

for prot_id_p in pfam_dict:
	pfam = pfam_dict[prot_id_p]
	bit = bit_dict[prot_id_p]
	desc = info_dict[pfam]
	print prot_id_p, bit, pfam, desc

	output_2.write((str(prot_id_p) + "\t" + str(bit)+ "\t" + str(pfam) + "\n"))
