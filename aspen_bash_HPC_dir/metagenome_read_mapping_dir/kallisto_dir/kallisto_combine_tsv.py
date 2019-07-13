import os
import sys
import subprocess
import numpy as np
import re
from glob import iglob
import glob
import pandas as pd
from pandas import DataFrame
import shlex
import operator
from collections import defaultdict
from Bio import SeqIO
from Bio.Seq import Seq
from Bio.Alphabet import generic_alphabet


input_folder = "/scicomp/home/opw9/bot_run_dir/test_kallisto/test_abund/"
ref_ab = pd.read_csv("/scicomp/home/opw9/bot_run_dir/test_kallisto/test_abund/abundance.tsv", sep="\t")
dirs = os.listdir(input_folder)

all_files = glob.glob(os.path.join(input_folder, "*.tsv"))
df_from_each_file = (pd.read_csv(f,sep="\t").set_index('target_id') for f in all_files)
#concatenated_df  = pd.concat(df_from_each_file, axis=1, join_axes=[ref_ab.index], join='inner')
concatenated_df  = pd.concat(df_from_each_file, axis=1, join='inner')
pd.set_option('display.max_columns',10000)
concatenated_df.to_csv("test.csv", sep=",")
print concatenated_df
