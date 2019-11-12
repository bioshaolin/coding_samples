#!/bin/bash
read -p "What subgroup?  " choice
if [ "$choice" == $choice ] ; then
	mkdir $choice
	chmod 777 $choice

	cd gbff_dir
	grep -n $choice *.gbff > temp_1.txt
	grep -n ORGANISM temp_1.txt > temp_2.txt
	grep -HFf temp_2.txt * > temp_3.txt
	cat temp_3.txt | sed -e 's/:/\t/g' > temp_4.txt
	awk -F "\t" '{print $3}' temp_4.txt > temp_4.5.txt
	awk '!seen[$0]++' temp_4.5.txt > temp_5.txt
	cat temp_5.txt | sed -e 's:_genomic.gbff::g' > sep_list.txt

	rm -f temp_1.txt
	rm -f temp_2.txt
	rm -f temp_3.txt
	rm -f temp_4.txt
	rm -f temp_4.5.txt
	rm -f temp_5.txt

	mv -f sep_list.txt ..
	cd ..

	mkdir $choice/nt_dir
	chmod 777 $choice/nt_dir

	mv -f sep_list.txt nt_dir
	cd nt_dir
	cat sep_list.txt | sed -e 's:$:_genomic.fna:g' > temp_nt.txt
	cat temp_nt.txt | while read LINE
	do
		cp $LINE ../$choice/nt_dir
	done
	mv -f sep_list.txt ..
	rm -f temp_nt.txt

	cd ..
	mkdir $choice/gbff_dir
	chmod 777 $choice/gbff_dir

	mv -f sep_list.txt gbff_dir
	cd gbff_dir
	cat sep_list.txt | sed -e 's:$:_genomic.gbff:g' > temp_gbff.txt
	cat temp_gbff.txt | while read LINE
	do
		cp $LINE ../$choice/gbff_dir
	done
	mv -f sep_list.txt ..
	rm -f temp_gbff.txt

	cd ..
	mkdir $choice/gff_dir
	chmod 777 $choice/gff_dir

	mv -f sep_list.txt gff_dir
	cd gff_dir
	cat sep_list.txt | sed -e 's:$:_genomic.gff:g' > temp_gff.txt
	cat temp_gff.txt | while read LINE
	do
		cp $LINE ../$choice/gff_dir
	done
	mv -f sep_list.txt ..
	rm -f temp_gff.txt

	cd ..
	mkdir $choice/rna_dir
	chmod 777 $choice/rna_dir

	mv -f sep_list.txt rna_from_genomic_dir
	cd rna_from_genomic_dir
	cat sep_list.txt | sed -e 's:$:_rna_from_genomic.fna:g' > temp_rna.txt
	cat temp_rna.txt | while read LINE
	do
		cp $LINE ../$choice/rna_dir
	done
	mv -f sep_list.txt ..
	rm -f temp_rna.txt

	cd ..
	cd $choice
	j=$(l nt_dir/ | wc -l)
	if [[ $j -gt 0 ]] ; then
		pwd
		cd ..
		ls
	else
		cd ..
		rm -rf $choice
		tput setaf 1 ; echo " *#*#* "  ; tput sgr 0
		tput setaf 1 ; echo "No subgroup identified by given parameter. Try another..." ; tput setaf 0
		tput setaf 1 ; echo " *#*#* " ; tput sgr 0
		tput setaf 0
	fi

#	cd ../$choice
#	pwd
#	ls
#	cd ..
	mkdir subgroup_list_dir
	chmod 777 subgroup_list_dir
	mv -f sep_list.txt $choice.sep_list.txt
	mv -f $choice.sep_list.txt subgroup_list_dir
else
	ls
fi
