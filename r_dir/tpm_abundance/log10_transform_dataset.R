new_tpm <- read.table("/Volumes/egetz_bio_1/r_script_dir/tpm_abundance/srf_pelagic_update.txt", sep="\t")
new_tpm
row.names(new_tpm) <- new_tpm[,1]
row.names
new_tpm <- new_tpm[,2:8]
tpm_matrix <- data.matrix(new_tpm)
tpm_matrix
new_tpm <- log10(tpm_matrix)
new_tpm
write.table(new_tpm, "/Volumes/egetz_bio_1/r_script_dir/tpm_abundance/final_log10_datasets/srf_pelagic.txt", sep="\t")
