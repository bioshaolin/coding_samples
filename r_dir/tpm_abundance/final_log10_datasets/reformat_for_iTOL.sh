#!/bin/bash

for file in *;
do
	sed -e 's:"::g' -e 's:-Inf:0:g' -e 's:NA:0:g' -e 's:,: :g' -e 's/0.301029995663981/0/g' $file > $file.done.txt
	rm -f reformat_for_iTOL.sh.done.txt
done