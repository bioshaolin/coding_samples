#!/bin/bash

cd ~/records_match/input_folder
cat records_temp1.txt | sed '1d' | sed -e 's:Empty\sDataFrame::g' |
sed -e 's:^\s*:\t:g'| sed -e 's:\t::g' | sed -e 's:\s:\t:g' | sed -e 's:\t\t:\t:g' |
sed -e 's:\t\t:\t:g' | sed -e 's:\t\t:\t:g' | awk '{$1=""}1' | sed -e 's:^ ::g' |
awk -v OFS="\t" '$1=$1' > records_$(date +%m.%d.%Y).txt
cat records_$(date +%m.%d.%Y).txt
mv -f records_temp1.txt ~/records_match/supplementary_data_dir
rm -f ~/records_match/supplementary_data_dir/records_temp1.txt
mv -f records_$(date +%m.%d.%Y).txt ~/records_match/output_dir
