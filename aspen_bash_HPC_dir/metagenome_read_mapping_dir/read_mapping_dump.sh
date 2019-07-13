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

#First option is for mapping to single metagenome
fastq-dump -X 10000 SRR5585000
#Second option will be for calling subscript to dump multiples

#First option is for dumping single genome through ftp server
wget -O D29.fna.gz ftp://ftp.ncbi.nlm.nih.gov/genomes/all/GCA/003/004/865/GCA_003004865.1_ASM300486v1/GCA_003004865.1_ASM300486v1_genomic.fna.gz
gunzip D29.fna.gz
#Second option willbe for dumping multiple genomes
