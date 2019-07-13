print """

Compiling Specified Columns
............................
"""

import os
import shutil
import sys
import subprocess
import re
import glob
import shlex
import operator
from collections import defaultdict
from Bio import SeqIO
import pandas as pd
import numpy as np

###########################################################################################################
###########################################################################################################
###  USAGE: python records_match.py <input_folder> <output_folder> <c1> <c(n)> <match_ID>,<match_ID(n)> ###
###  NOTE: c1 = column 1                                                                                ###
###########################################################################################################
###########################################################################################################

subprocess.call("source ~/records_match/src/cat_inputs.sh", shell=True)
input_folder = sys.argv[1]
out1 = open(input_folder + "selection_input1.2.txt", "a")
dirs = os.listdir(input_folder)

for file in dirs:
	if file.endswith("1.1.txt"):
		path = open(input_folder + file, "r")
		for j in path.readlines():
			line = j.rstrip()
			tabs = line.split("\t")
			if len(sys.argv) == 5:
				c1 = sys.argv[3] = tabs[0]
				out1.write(tabs[0])
				out1.seek(0)
				print tabs[0]
			elif len(sys.argv) == 6:
				c1 = sys.argv[3] = tabs[0]
				c2 = sys.argv[4] = tabs[1]
				two = c1 + "\t" + c2
				out1.write(tabs[0] + "\t" + tabs[1] + "\n")
				out1.seek(0)
				print tabs[0] + "\t" + tabs[1]
			elif len(sys.argv) == 7:
				c1 = sys.argv[3] = tabs[0]
				c2 = sys.argv[4] = tabs[1]
				c3 = sys.argv[5] = tabs[2]
				out1.write(tabs[0] + "\t" + tabs[1] + "\t" + tabs[2] + "\n")
				out1.seek(0)
				print tabs[0] + "\t" + tabs[1] + "\t" + tabs[2]
			elif len(sys.argv) == 8:
				c1 = sys.argv[3] = tabs[0]
				c2 = sys.argv[4] = tabs[1]
				c3 = sys.argv[5] = tabs[2]
				c4 = sys.argv[6] = tabs[3]
				out1.write(tabs[0] + "\t" + tabs[1] + "\t" + tabs[2] + "\t" + tabs[3] + "\n")
				out1.seek(0)
				print tabs[0] + "\t" + tabs[1] + "\t" + tabs[2] + "\t" + tabs[3]
			else:
				pass

print """

Praparing Data Match
.....................
"""

for file in dirs:
	if file.endswith("1.2.txt"):
		path1 = open(input_folder + file, "r")
		data = pd.read_csv(path1, sep = "\t", engine = "python", header = None)
		if len(sys.argv) == 6:
			output_folder = sys.argv[2]
			o_path = open(input_folder + "records_temp1.txt", "a")
			data.columns = ["name", "value1"]
			array2 = sys.argv[5].split(",")
			one = data.loc[data["value1"].isin(array2)]
			o_path.write(str(one))
			o_path.close()
			subprocess.call("source ~/records_match/src/records_parse_fix.sh", shell=True)
		elif len(sys.argv) == 7:
			output_folder = sys.argv[2]
			o_path = open(input_folder + "records_temp1.txt", "a")
			data.columns = ["name", "value1", "value2"]
			data.set_index("name", inplace=True)
			array1 = sys.argv[6].split(",")
			one = data.loc[data["value2"].isin(array1)]
			o_path.write(str(one))
			o_path.close()
			subprocess.call("source ~/records_match/src/records_parse_fix.sh", shell=True)
		elif len(sys.argv) == 8:
			output_folder = sys.argv[2]
			o_path = open(input_folder + "records_temp1.txt", "a")
			data.columns = ["name", "value1", "value2", "value3"]
			array2 = sys.argv[7].split(",")
			one = data.loc[data["value3"].isin(array2)]
			o_path.write(str(one))
			o_path.close()
			subprocess.call("source ~/records_match/src/records_parse_fix.sh", shell=True)
		else:
			pass

shutil.move(input_folder + "/concat_input1.1.txt", "./records_match/supplementary_data_dir/concat_input1.1.txt")
shutil.move(input_folder + "selection_input1.2.txt", "./records_match/supplementary_data_dir/selection_input1.2.txt")
