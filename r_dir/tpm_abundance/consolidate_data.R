
########################################################################
x <- read.table(file="/Volumes/egetz_bio_1/r_script_dir/tpm_abundance/tpm_byrun_final_UPDATE.txt", header=T, row.names=1)

row <- row.names(x)
row1 <- gsub("_genomic.fna", "", row.names(x))
row2 <- gsub(".fna", "", row1)
row3 <- gsub(".fa", "", row2)
row4 <- gsub("_", ".", row3)
row.names(x) <- row4

abund <- t(x)

data <- read.table(file="/Volumes/egetz_bio_1/r_script_dir/tpm_abundance/tara_data_byrun.txt", header=F, row.names=1, sep=",")
samples <- data[row.names(abund),1]
#######################################################################

#######################################################################
full_data1 <- data.frame(cbind(as.character(samples), abund), check.names=F)
for(i in 2:dim(full_data1)[2]) {
#print(i)
full_data1[,i] <- as.numeric(as.character(full_data1[,i]))
}

write.table(full_data1, file="full_data1.txt", sep="\t", quote=F)
cons <- aggregate(full_data1, by=list(full_data1$V1), FUN=mean)
#row.names(cons) <- as.character(full_data1$V1)
write.table(cons, file="cons_data2.txt", sep="\t", quote=F)
#######################################################################

#######################################################################
f <- cons[,3:dim(cons)[2]]
row.names(f) <- cons$Group.1
l <- t(log10(f + 1))

#srf <- c("TARA_123_MIX_0.1-0.22", "TARA_124_MIX_0.22-3", "TARA_152_MIX_0.22-3", "TARA_036_SRF_0.1-0.22", "TARA_065_SRF_0.1-0.22", "TARA_034_SRF_0.1-0.22", "TARA_048_SRF_0.1-0.22", "TARA_122_SRF_0.1-0.22", "TARA_124_SRF_0.1-0.22", "TARA_125_SRF_0.1-0.22", "TARA_036_SRF_0.22-1.6", "TARA_064_SRF_0.22-3", "TARA_065_SRF_0.22-3", "TARA_141_SRF_0.22-3", "TARA_140_SRF_0.22-3", "TARA_032_SRF_0.22-1.6", "TARA_066_SRF_0.22-3", "TARA_067_SRF_0.22-3", "TARA_067_SRF_0.22-0.45", "TARA_093_SRF_0.22-3", "TARA_084_SRF_0.22-3", "TARA_085_SRF_0.22-3", "TARA_038_SRF_0.22-1.6", "TARA_052_SRF_0.22-1.6", "TARA_137_SRF_0.22-3", "TARA_138_SRF_0.22-3", "TARA_068_SRF_0.22-3", "TARA_078_SRF_0.22-0.45", "TARA_125_SRF_0.22-3", "TARA_125_SRF_0.22-0.45", "TARA_128_SRF_0.22-3", "TARA_007_SRF_0.22-1.6", "TARA_030_SRF_0.22-1.6", "TARA_004_SRF_0.22-1.6", "TARA_145_SRF_0.22-3", "TARA_152_SRF_0.22-3")
#dcm <- c("TARA_064_DCM_0.1-0.22", "TARA_122_DCM_0.1-0.22", "TARA_036_DCM_0.22-1.6", "TARA_058_DCM_0.22-3", "TARA_142_DCM_0.22-3", "TARA_109_DCM_0.22-3", "TARA_032_DCM_0.22-1.6", "TARA_066_DCM_0.22-3", "TARA_093_DCM_0.22-3", "TARA_085_DCM_0.22-3", "TARA_038_DCM_0.22-1.6", "TARA_052_DCM_0.22-1.6", "TARA_137_DCM_0.22-3", "TARA_068_DCM_0.22-3", "TARA_078_DCM_0.22-0.45", "TARA_098_DCM_0.22-3", "TARA_122_DCM_0.22-0.45", "TARA_128_DCM_0.22-3", "TARA_030_DCM_0.22-1.6", "TARA_150_DCM_0.22-3", "TARA_151_DCM_0.22-3", "TARA_025_DCM_<-0.22", "TARA_034_DCM_<-0.22", "TARA_039_DCM_0.22-1.6", "TARA_052_DCM_<-0.22", "TARA_076_DCM_0.45-0.8", "TARA_076_DCM_<-0.22", "TARA_082_DCM_<-0.22", "TARA_109_DCM_<-0.22", "TARA_100_MES_0.22-3")
#mes <- c("TARA_100_MES_0.22-3", "TARA_122_MES_0.1-0.22", "TARA_065_MES_0.22-3", "TARA_142_MES_0.22-3", "TARA_085_MES_0.22-3", "TARA_137_MES_0.22-3", "TARA_078_MES_0.22-3", "TARA_122_MES_0.22-3", "TARA_122_MES_0.22-0.45", "TARA_146_MES_0.22-3", "TARA_133_MES_0.22-3", "TARA_056_MES_0.22-3", "TARA_064_MES_0.22-3", "TARA_070_MES_0.22-0.45", "TARA_072_MES_0.22-3", "TARA_078_MES_0.45-0.8", "TARA_037_MES_0.1-0.22", "TARA_038_MES_0.1-0.22", "TARA_037_MES_0.22-1.6", "TARA_109_MES_0.22-3", "TARA_038_MES_0.22-1.6", "TARA_110_MES_0.22-3", "TARA_111_MES_0.22-3", "TARA_145_MES_0.22-3", "TARA_102_MES_0.22-3")

final <- l[,]

sums <- colSums(final)
nonzero <- sums[sums > 0]
final_nonzero <- final[,names(nonzero)]
write.table(final_nonzero, file="log10_tpm_all1.txt", sep="\t", quote=F)


#srfmat <- final_nonzero[,intersect(names(nonzero), srf)]
#mesmat <- final_nonzero[,intersect(names(nonzero), mes)]
#dcmmat <- final_nonzero[,intersect(names(nonzero), dcm)]

#write.table(mesmat, file="log10_abund_mes.txt", sep=" ", quote=F)
#write.table(srfmat, file="log10_abund_srf.txt", sep=" ", quote=F)
#write.table(dcmmat, file="log10_abund_dcm.txt", sep=" ", quote=F)

#######################################################################


#####################################################################################
########################### Final for specific groupings ############################
#####################################################################################


x <- read.table(file="log10_tpm_all1.final.txt", header=T, row.names=1, check.names=F)

srf_coastal <- c('TARA_036_SRF_0.1-0.22', 'TARA_036_SRF_0.22-1.6', 'TARA_066_SRF_0.22-3', 'TARA_067_SRF_0.22-3', 'TARA_067_SRF_0.22-0.45', 'TARA_140_SRF_0.22-3', 'TARA_093_SRF_0.22-3', 'TARA_065_SRF_0.1-0.22', 'TARA_064_SRF_0.22-3', 'TARA_065_SRF_0.22-3', 'TARA_141_SRF_0.22-3', 'TARA_034_SRF_0.1-0.22', 'TARA_032_SRF_0.22-1.6', 'TARA_084_SRF_0.22-3', 'TARA_085_SRF_0.22-3')
srf_pelagic <- c('TARA_048_SRF_0.1-0.22', 'TARA_052_SRF_0.22-1.6', 'TARA_038_SRF_0.22-1.6', 'TARA_128_SRF_0.22-3', 'TARA_137_SRF_0.22-3', 'TARA_138_SRF_0.22-3', 'TARA_068_SRF_0.22-3', 'TARA_078_SRF_0.22-0.45', 'TARA_122_SRF_0.1-0.22', 'TARA_124_SRF_0.1-0.22', 'TARA_125_SRF_0.1-0.22', 'TARA_125_SRF_0.22-3', 'TARA_125_SRF_0.22-0.45', 'TARA_145_SRF_0.22-3', 'TARA_007_SRF_0.22-1.6', 'TARA_030_SRF_0.22-1.6', 'TARA_004_SRF_0.22-1.6', 'TARA_152_SRF_0.22-3', 'TARA_125_MIX_0.45-0.8', 'TARA_123_MIX_0.45-0.8', 'TARA_038_SRF_0.1-0.22', 'TARA_132_SRF_0.22-3')
dcm_coastal <- c('TARA_036_DCM_0.22-1.6', 'TARA_066_DCM_0.22-3', 'TARA_142_DCM_0.22-3', 'TARA_109_DCM_0.22-3', 'TARA_093_DCM_0.22-3', 'TARA_109_DCM_<-0.22', 'TARA_064_DCM_0.1-0.22', 'TARA_058_DCM_0.22-3', 'TARA_082_DCM_<-0.22', 'TARA_032_DCM_0.22-1.6', 'TARA_034_DCM_<-0.22', 'TARA_085_DCM_0.22-3', 'TARA_082_DCM_<-0.22', 'TARA_109_DCM_<-0.22', 'TARA_032_DCM_0.22-1.6', 'TARA_034_DCM_0.22-1.6', 'TARA_032_DCM_<-0.22', 'TARA_036_DCM_<-0.22', 'TARA_036_DCM_0.22-1.6', 'TARA_064_DCM_<-0.22
')
dcm_pelagic <- c('TARA_052_DCM_0.22-1.6', 'TARA_052_DCM_<-0.22', 'TARA_038_DCM_0.22-1.6', 'TARA_039_DCM_0.22-1.6', 'TARA_128_DCM_0.22-3', 'TARA_137_DCM_0.22-3', 'TARA_068_DCM_0.22-3', 'TARA_078_DCM_0.22-0.45', 'TARA_076_DCM_0.45-0.8', 'TARA_076_DCM_<-0.22', 'TARA_122_DCM_0.1-0.22', 'TARA_098_DCM_0.22-3', 'TARA_122_DCM_0.22-0.45', 'TARA_030_DCM_0.22-1.6', 'TARA_025_DCM_<-0.22', 'TARA_151_DCM_0.22-3', 'TARA_150_DCM_0.22-3', 'TARA_100_MES_0.22-3', 'TARA_110_DCM_0.22-3', 'TARA_030_DCM_0.22-1.6', 'TARA_025_DCM_0.22-1.6', 'TARA_025_DCM_<-0.22', 'TARA_004_DCM_0.22-1.6', 'TARA_018_DCM_0.22-1.6', 'TARA_038_DCM_<-0.22', 'TARA_018_DCM_<-0.22', 'TARA_009_DCM_0.22-1.6', 'TARA_038_DCM_0.22-1.6', 'TARA_041_DCM_0.22-1.6', 'TARA_041_DCM_<-0.22', 'TARA_076_DCM_0.45-0.8', 'TARA_023_DCM_0.22-1.6', 'TARA_039_DCM_<-0.22')
mes_norm <- c('TARA_142_MES_0.22-3', 'TARA_065_MES_0.22-3', 'TARA_056_MES_0.22-3', 'TARA_064_MES_0.22-3', 'TARA_085_MES_0.22-3', 'TARA_137_MES_0.22-3', 'TARA_078_MES_0.22-3', 'TARA_070_MES_0.22-0.45', 'TARA_072_MES_0.22-3', 'TARA_078_MES_0.45-0.8', 'TARA_122_MES_0.1-0.22', 'TARA_122_MES_0.22-3', 'TARA_122_MES_0.22-0.45', 'TARA_146_MES_0.22-3', 'TARA_133_MES_0.22-3', 'TARA_068_MES_0.45-0.8', 'TARA_070_MES_0.45-0.8')
mes_omz <- c('TARA_037_MES_0.1-0.22', 'TARA_037_MES_0.22-1.6', 'TARA_109_MES_0.22-3', 'TARA_038_MES_0.1-0.22', 'TARA_038_MES_0.22-1.6', 'TARA_102_MES_0.22-3', 'TARA_110_MES_0.22-3', 'TARA_111_MES_0.22-3', 'TARA_145_MES_0.22-3')



srfcoast_mat <- x[,intersect(colnames(x), srf_coastal)]
srfpelag_mat <- x[,intersect(colnames(x), srf_pelagic)]
dcmcoast_mat <- x[,intersect(colnames(x), dcm_coastal)]
dcmpelag_mat <- x[,intersect(colnames(x), dcm_pelagic)]
mesnorm_mat  <- x[,intersect(colnames(x), mes_norm)]
mesomz_mat   <- x[,intersect(colnames(x), mes_omz)]

write.table(mesomz_mat, file="log10_abund_mesomz.txt", sep=" ", quote=F)
write.table(mesnorm_mat, file="log10_abund_mesnorm.txt", sep=" ", quote=F)

write.table(srfcoast_mat, file="log10_abund_srfcoast.txt", sep=" ", quote=F)
write.table(srfpelag_mat, file="log10_abund_srfpelag.txt", sep=" ", quote=F)

write.table(dcmcoast_mat, file="log10_abund_dcmcoast.txt", sep=" ", quote=F)
write.table(dcmpelag_mat, file="log10_abund_dcmpelag.txt", sep=" ", quote=F)














