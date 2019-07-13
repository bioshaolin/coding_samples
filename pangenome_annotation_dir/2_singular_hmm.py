import os
import sys
import subprocess
import re
import glob
import shlex
import operator
from collections import defaultdict
#from Bio import SeqIO

# This script requires that HMMER3 is installed in the PATH of the computer before running. 
#input_folder = "/Volumes/egetz_bio_1/marinimicrobia_dir/parks_et_al_marinimicrobia_genomes_dir" # This should be a folder full of protein fasta files, with suffix .faa
#input_folder = "/Volumes/base_1/Users/erikgetz/Desktop/hmm_test/protein_files"
db = "/Volumes/egetz_bio_1/hmm_universal_dir/nog_dir/COG.hmm" # this is the combined file of all the HMM profiles. 
input_folder = "/Volumes/egetz_bio_1/marinimicrobia_dir/final_set_dir/completeness_reps_dir/completeness_proteins_dir"
#input_1 = "/Volumes/base_1/Users/erikgetz/Downloads"

#output_1 = "/Volumes/base_1/Users/erikgetz/Desktop/flavo_dir"


#clear = open("error_file.txt", "w")
#clear.close()

#for fsa_nt_file in os.listdir(input_folder):
#	if fsa_nt_file.endswith(".fna"):
#		input_path = os.path.join(input_folder, fsa_nt_file)
#		output_path = re.sub(".fna", ".faa", input_path)
#		print(fsa_nt_file, input_path, output_path)
		
#		cmd = "prodigal -i" + " " + input_path + " " "-a" " " + output_path
#		print(cmd)
#		cmd2 = shlex.split(cmd)
#		subprocess.call(cmd2, stdout=open("prodigal_faa.out", 'a'), stderr=open("error_file.txt", 'a'))

for protein_file in os.listdir(input_folder):
	print(input_folder)
	if protein_file.endswith(".faa"):
		input_path = os.path.join(input_folder, protein_file)
		output_path = re.sub(".faa", ".hmmout", input_path)
		print(protein_file, input_path, output_path)

		cmd = "hmmsearch --incE 1e-5 --tblout " + output_path + " " + db + " " + input_path
		print(cmd)
		cmd2 = shlex.split(cmd)
		subprocess.call(cmd2, stdout=open('hmmout.cog.txt', 'a'), stderr=open("error_file.txt", 'a'))

dirs = os.listdir(input_folder)
for filenames in dirs:
	if filenames.endswith(".hmmout"):

		acc = re.sub(".hmmout", "", filenames)
		f = open(input_folder+"/"+filenames, 'r')
		o = open(input_folder+"/"+filenames+".comp.parsed", 'w')
		hit_dict = {}
		bit_dict = defaultdict(int)
		hit_type = {}
		marker_dict = {}
		
		for line in f.readlines():
			if line.startswith("#"):
				pass
			else:
				newline = re.sub( '\s+', '\t', line)
				list1 = newline.split('\t')
				print list1
				ids = list1[0]
				null = list1[1]
				hit = list1[2]
				cog_id = list1[3]
				evalue = list1[4]
				bit_score = list1[5]
		
		
		
				if float(evalue) <= 1e-5 and float(bit_score) >50:
#					print(query)
					o.write(ids + "\t" + hit + "\t" + evalue + "\t" + bit_score + "\n")