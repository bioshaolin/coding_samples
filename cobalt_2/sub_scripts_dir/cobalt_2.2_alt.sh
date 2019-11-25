#!/bin/bash
read -p "Name of project directory?  " proj
if [ "$proj" == $proj ] ; then

	mkdir ~/$proj
	chmod 777 ~/$proj
	mv -f ~/*assembly_summary* ~/$proj
	cd $proj

	cat *.txt* > assembly_summary_temp.txt
	cat assembly_summary_temp.txt | sed -e 's:\tPR.*ftp:\tftp:g' > assembly_summary_parsed.txt
	awk -F "\t" '{print $2}' assembly_summary_parsed.txt > ftp_temp_1.txt
	cat ftp_temp_1.txt | sed '1,2d' > ftp_temp_2.txt
	cat ftp_temp_2.txt | sed -e 's:/:\t:g' > ftp_temp_3.txt
	awk -F "\t" '{print $1 FS $2 FS $3 FS $4 FS $5 FS $6 FS $7 FS $8 FS $8}' ftp_temp_3.txt > ftp_temp_4.txt
	cat ftp_temp_4.txt | sed -e 's:\t:/:g' | sed -e 's:$:_genomic.fna.gz:g' > ftp_temp_5.txt
	cat ftp_temp_5.txt | sed -e 's://::g' > ftp_genome_list_temp.txt
	sort -u ftp_genome_list_temp.txt > ftp_genome_list_temp2.txt
	cat ftp_genome_list_temp2.txt | sed -e 's:^_genomic.fna.gz::g' > ftp_genome_list.txt

	rm -f ftp_temp_1.txt
	rm -f ftp_temp_2.txt
	rm -f ftp_temp_3.txt
	rm -f ftp_temp_4.txt
	rm -f ftp_temp_5.txt
	rm -f assembly_summary_temp.txt
	rm -f ftp_genome_list_temp.txt
	rm -f ftp_genome_list_temp2.txt

	mkdir assembly_summaries_dir
	chmod 777 assembly_summaries_dir
	mv -f *assembly_summary* assembly_summaries_dir

	mkdir nt_dir
	chmod 777 nt_dir
	cp ftp_genome_list.txt nt_dir
	cd nt_dir

	cat ftp_genome_list.txt | while read LINE
	do
		wget $LINE
	done

	gunzip *.fna.gz

	cd ~/$proj

	mv -f ~/$proj/assembly_summaries_dir/assembly_summary_parsed.txt ~/$proj

	awk -F "\t" '{print $2}' assembly_summary_parsed.txt > ftp_temp_1.txt
	cat ftp_temp_1.txt | sed '1,2d' > ftp_temp_2.txt
	cat ftp_temp_2.txt | sed -e 's:/:\t:g' > ftp_temp_3.txt
	awk -F "\t" '{print $1 FS $2 FS $3 FS $4 FS $5 FS $6 FS $7 FS $8 FS $8}' ftp_temp_3.txt > ftp_temp_4.txt
	cat ftp_temp_4.txt | sed -e 's:\t:/:g' | sed -e 's:$:_genomic.gbff.gz:g' > ftp_temp_5.txt
	cat ftp_temp_5.txt | sed -e 's://::g' > ftp_gbff_list_temp.txt
	sort -u ftp_gbff_list_temp.txt > ftp_gbff_list_temp2.txt
	cat ftp_gbff_list_temp2.txt | sed -e 's:^_genomic.gbff.gz::g' > ftp_gbff_list.txt

	rm -f ftp_temp_1.txt
	rm -f ftp_temp_2.txt
	rm -f ftp_temp_3.txt
	rm -f ftp_temp_4.txt
	rm -f ftp_temp_5.txt
	rm -f assembly_summary_temp.txt
	rm -f ftp_gbff_list_temp.txt
	rm -f ftp_gbff_list_temp2.txt

	mkdir gbff_dir
	chmod 777 gbff_dir
	cp ftp_gbff_list.txt gbff_dir
	cd gbff_dir

	cat ftp_gbff_list.txt | while read LINE
	do
		wget $LINE
	done

	gunzip *.gbff.gz

	cd ~/$proj

	awk -F "\t" '{print $2}' assembly_summary_parsed.txt > ftp_temp_1.txt
	cat ftp_temp_1.txt | sed '1,2d' > ftp_temp_2.txt
	cat ftp_temp_2.txt | sed -e 's:/:\t:g' > ftp_temp_3.txt
	awk -F "\t" '{print $1 FS $2 FS $3 FS $4 FS $5 FS $6 FS $7 FS $8 FS $8}' ftp_temp_3.txt > ftp_temp_4.txt
	cat ftp_temp_4.txt | sed -e 's:\t:/:g' | sed -e 's:$:_genomic.gff.gz:g' > ftp_temp_5.txt
	cat ftp_temp_5.txt | sed -e 's://::g' > ftp_gff_list_temp.txt
	sort -u ftp_gff_list_temp.txt > ftp_gff_list_temp2.txt
	cat ftp_gff_list_temp2.txt | sed -e 's:^_genomic.gff.gz::g' > ftp_gff_list.txt

	rm -f ftp_temp_1.txt
	rm -f ftp_temp_2.txt
	rm -f ftp_temp_3.txt
	rm -f ftp_temp_4.txt
	rm -f ftp_temp_5.txt
	rm -f assembly_summary_temp.txt
	rm -f ftp_gff_list_temp.txt
	rm -f ftp_gff_list_temp2.txt

	mkdir gff_dir
	chmod 777 gff_dir
	cp ftp_gff_list.txt gff_dir
	cd gff_dir

	cat ftp_gff_list.txt | while read LINE
	do
		wget $LINE
	done

	gunzip *.gff.gz

	cd ~/$proj

	awk -F "\t" '{print $2}' assembly_summary_parsed.txt > ftp_temp_1.txt
	cat ftp_temp_1.txt | sed '1,2d' > ftp_temp_2.txt
	cat ftp_temp_2.txt | sed -e 's:/:\t:g' > ftp_temp_3.txt
	awk -F "\t" '{print $1 FS $2 FS $3 FS $4 FS $5 FS $6 FS $7 FS $8 FS $8}' ftp_temp_3.txt > ftp_temp_4.txt
	cat ftp_temp_4.txt | sed -e 's:\t:/:g' | sed -e 's:$:_rna_from_genomic.fna.gz:g' > ftp_temp_5.txt
	cat ftp_temp_5.txt | sed -e 's://::g' > ftp_rna_from_genomic_list_temp.txt
	sort -u ftp_rna_from_genomic_list_temp.txt > ftp_rna_from_genomic_list_temp2.txt
	cat ftp_rna_from_genomic_list_temp2.txt | sed -e 's:^_rna_from_genomic.fna.gz::g' > ftp_rna_from_genomic_list.txt

	rm -f ftp_temp_1.txt
	rm -f ftp_temp_2.txt
	rm -f ftp_temp_3.txt
	rm -f ftp_temp_4.txt
	rm -f ftp_temp_5.txt
	rm -f assembly_summary_temp.txt
	rm -f ftp_rna_from_genomic_list_temp.txt
	rm -f ftp_rna_from_genomic_list_temp2.txt

	mkdir rna_from_genomic_dir
	chmod 777 rna_from_genomic_dir
	cp ftp_rna_from_genomic_list.txt rna_from_genomic_dir
	cd rna_from_genomic_dir

	cat ftp_rna_from_genomic_list.txt | while read LINE
	do
		wget $LINE
	done

	gunzip *.fna.gz

	cd ~/$proj

	mkdir ftp_list_dir
	chmod 777 ftp_list_dir
	mv -f *ftp_*.txt ftp_list_dir
fi

while true;
do
	read -p "Search, Copy and Separate a subgroup in $proj? (y/n)  " choice
	if [ "$choice" = "y" ] ; then
		source ~/cobalt_2/separate_subgroup.sh
	elif [ "$choice" = "n" ] ; then
		echo "##############################################################################
##############################################################################
##############################################################################
##############################################################################
##############################################################################
####################                      ####################################
####################   #########zzz       ####################################
####################  ##                  ####################################
####################  ##                  ####################################
####################   #########zzz       ####################################
####################                      ####################################
##############################################################################
##############################################################################

"
		pwd
		ls
		return
	fi
done
