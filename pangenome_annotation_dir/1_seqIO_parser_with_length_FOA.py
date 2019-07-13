import os
import sys
import subprocess
import numpy as np
import re
import shlex
import operator
from collections import defaultdict
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import generic_alphabet

input = "/Volumes/egetz_bio_1/marinimicrobia_dir/final_set_dir/proteins"

dirs = os.listdir(input)

seq_dict = defaultdict(int)
seq_1_dict = defaultdict(list)
rec_dict = {}
seq_list = []
length = []
for filenames in dirs:
	if filenames.endswith(".faa"):
		f = open(input + "/" + filenames, 'r')
		for record in SeqIO.parse(f, "fasta"):
			seq_dict[record.id] = len(record.seq) 
#			print(record.seq)
			rec_dict[record.id] = record # I changed "record.seq" to just "record" so that the dictionary stored all the info necessary for SeqIO.write() later on.
			seq_list.append(record.seq)
#			print(seq_list)

proteinortho = open("/Volumes/egetz_bio_1/marinimicrobia_dir/final_set_dir/proteinortho_final_set_dir/final_set_dir.proteinortho", "r")
max_length = defaultdict(int)
final_set = {}
record_set = {}
n = 0
for i in proteinortho.readlines():
	if i.startswith("#"):
		pass
	else:
		n +=1
		cluster = "cluster_"+str(n)
		line = i.rstrip()
		line1 = re.sub(",", "\t", line)
		tabs = line1.split("\t")
		for items in tabs[3:len(tabs)]:
			length = seq_dict[items]
			if length > max_length[cluster]:
				max_length[cluster] = length
				final_set[cluster] = items

				record = rec_dict[items] # this pulls out the full record for the protein of interest
				record_set[cluster] = record # this adds the record information for the protein of interest to a dictionary, which will be replaced if another longer one is found later. 

				##### Thought 1 ######
				seq_1_dict[cluster] = final_set
#				for key in seq_1_dict.iteritems():
#					print key
#					if items in seq_1_dict:
#						seq_1_dict[items].append(seq_list)
#						print(items)

#						SeqIO.write(items, "/Volumes/base_1/Users/erikgetz/Desktop/test_test.faa", "fasta")

	
output = open("pangenome.txt", "w")
list_of_records = record_set.values()
print type(list_of_records), list_of_records[0]
SeqIO.write(list_of_records, output, "fasta")
#for j in final_set:
#	output.write( j +"\t"+ final_set[j] +"\t"+ str(max_length[j]) +"\n")
	

####### Thought 2 #####
#f_2 = open("/Volumes/base_1/Users/erikgetz/Desktop/output.txt", 'r')
#for i in f_2.readlines():
#	tabs = i.split("\t")
	
#	for match in tabs[1:len(tabs)]:
#		print(seq_list)
#		if match in final_set:
#			print(record.seq)




#				output_2 = open("output_2.txt", "w")
#				for match in rec_dict:
#					output_2.write(match)
