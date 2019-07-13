#!/bin/bash -l

module load perl/5.26.1
module load Python/2.7.3

module load ncbi-blast+/LATEST
module load Entrez/E-utilities
module load sratoolkit/2.9.1
module load prokka/1.8
module load hmmer/3.1b2
module load bamtools/2.3.0
module load BEDTools/2.26.0
module load bowtie2/2.3.3.1
module load samtools/1.8
module load seqtk/1.2
module load SPAdes/3.9.0
module load muscle/3.8.425
module load FastTree/2.1.8
module load clcgenomicswb/10.1.64
module load bedops/2.4.26

cd /scicomp/home/opw9/read_mapping_dir/test_dir/

#############################################################
#Dump,Produce log; output = .fastq , D29.*$ (Exclude ".bt2")#
#############################################################

# mapping to single metagenome
fastq-dump -X 10000 SRR5585000
#dumping single genome through ftp server
wget -O D29.fna.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/004/865/GCA_003004865.1_ASM300486v1/GCA_003004865.1_ASM300486v1_genomic.fna.gz
gunzip D29.fna.gz
bowtie2-build D29.fna D29 > bowtie2.log

###########################
#Read Map; output = *.sam$#
###########################

bowtie2 -U SRR5585000.fastq -x D29 -S mapping_out.sam

###################################################################
#.SAM Processing; output = .bai OR .bam (based on wd dependencies)#
###################################################################

samtools view -bS -F 4 mapping_out.sam > mapping_out.bam
samtools sort mapping_out.bam -o mapping_out.sort.bam
samtools index mapping_out.sort.bam

##########################
#.GFF dump; output = .gff#
##########################

wget -O D29.gff.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/004/865/GCA_003004865.1_ASM300486v1/GCA_003004865.1_ASM300486v1_genomic.gff.gz
gunzip D29.gff.gz
gff2bed < D29.gff > D29.bed

#####################
#ID high expressions#
#####################

bedtools intersect -a D29.bed -c -bed -f 0.2 -b mapping_out.sort.bam > temp1.txt
sort -t $'\t' -k 11,11nr -V temp1.txt > intersect.txt
rm -f temp1.txt
