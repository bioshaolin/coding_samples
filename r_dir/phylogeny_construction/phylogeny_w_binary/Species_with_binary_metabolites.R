library(ggplot2)
library(ggpubr)
library(RColorBrewer)
library(colorRamps)
library(colorspace)
library(crayon)
library(ggsci)
library(ggtree)
library(ape)
library(cowplot)
library(grid)
library(gridExtra)
#library(ggdendro)
#library(pheatmap)
#display.brewer.all()
#library(phylobase)

#source("https://bioconductor.org/biocLite.R")
#biocLite("biocUpgrade")
#biocLite("ggtree")


#######################################################
### read.tree and set parameters/clade distinctions ###
#######################################################

tree = read.tree("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/tree_products_dir/C.botulinum_final_tree.nw")
tree$tip.label 
cls = list("Group 3 (P/NP)"=c("GCF.000014125.1.ASM1412v1.genomic" ,"GCF.003614235.1.ASM361423v1.genomic" ,
                    "GCF.001266905.1.ASM126690v1.genomic" ,"GCF.001266955.1.ASM126695v1.genomic" ,
                    "GCF.001267015.1.ASM126701v1.genomic" ,"GCF.001266895.1.ASM126689v1.genomic" ,
                    "GCF.000204375.2.V891.0.2.genomic" ,"GCF.001264545.1.ASM126454v1.genomic" ,
                    "GCF.001264605.1.ASM126460v1.genomic" ,"GCF.001264515.1.ASM126451v1.genomic" ,
                    "GCF.001267035.1.ASM126703v1.genomic" ,"GCF.001266995.1.ASM126699v1.genomic" ,
                    "GCF.001264505.1.ASM126450v1.genomic" ,"GCF.000204565.1.ASM20456v1.genomic" ,
                    "GCF.001264575.1.ASM126457v1.genomic" ,"GCF.001266965.1.ASM126696v1.genomic" ,
                    "GCF.001264475.1.ASM126447v1.genomic" ,"GCF.001266875.1.ASM126687v1.genomic" ,
                    "GCF.001264555.1.ASM126455v1.genomic" ,"GCF.001266885.1.ASM126688v1.genomic" ,
                    "GCF.001267045.1.ASM126704v1.genomic"),
           "Group 1 (Proteolytic)"=c("GCF.000816965.1.ASM81696v1.genomic", "GCF.000503815.1.ASM50381v1.genomic", 
                     "GCF.002865785.1.ASM286578v1.genomic", "GCF.000171075.1.ASM17107v1.genomic", 
                     "GCF.000817935.1.ASM81793v1.genomic", "GCF.000020345.1.ASM2034v1.genomic", 
                     "GCF.003345335.1.ASM334533v1.genomic", "CDC61189PL1-SN0054-18-007", 
                     "GCF.002865825.1.ASM286582v1.genomic", "GCF.002866045.1.ASM286604v1.genomic", 
                     "GCF.000019545.1.ASM1954v1.genomic", "GCF.000019305.1.ASM1930v1.genomic", 
                     "GCF.000092345.1.ASM9234v1.genomic", "GCF.000017065.1.ASM1706v1.genomic", 
                     "GCF.000253195.1.ASM25319v1.genomic", "GCF.002865765.1.ASM286576v1.genomic",
                     "GCF.000829015.1.ASM82901v1.genomic", "GCF.002865745.1.ASM286574v1.genomic", 
                     "GCF.000017045.1.ASM1704v1.genomic", "CDC60253PL1-SN0253-16-001-080316", 
                     "GCF.002865845.1.ASM286584v1.genomic", "GCF.000439815.2.ASM43981v2.genomic",
                     "GCF.000730965.1.ASM73096v1.genomic", "CDC43305T5-SN0054-18-013", 
                     "GCF.001879605.1.ASM187960v1.genomic", "GCF.003345315.1.ASM334531v1.genomic", 
                     "CDC61111PL1-SN0054-18-003", "GCF.001020205.1.ASM102020v1.genomic"), 
           "Group 2 (Non-Proteolytic)"=c("GCF.000750055.1.ASM75005v1.genomic", "GCF.000789355.1.ASM78935v1.genomic",
                     "GCF.000750065.1.ASM75006v1.genomic", "GCF.000307125.1.ASM30712v1.genomic",
                     "GCF.000020165.1.ASM2016v1.genomic", "GCF.000020285.1.ASM2028v1.genomic", 
                     "GCF.000827955.1.ASM82795v1.genomic", "GCF.000827935.1.ASM82793v1.genomic",
                     "CDC59470PL2-SN0054-18-013", "CDC59470PL2-SN0054-18-019", "CDC59471H2-SN0054-18-013",
                     "CDC59471H2-SN0054-18-020", "CDC42747PL1.TR3-SN0054-18-025"),
           "Group 4"=c("GCF.002074155.1.ASM207415v1.genomic"),
           "C.perfringens"=c("GCA.000013845.2.ASM1384v2.genomic", "GCF.002355795.1.ASM235579v1.genomic",
                            "GCF.001579785.1.ASM157978v1.genomic", "GCF.001854085.1.ASM185408v1.genomic",
                            "GCF.000009685.1.ASM968v1.genomic", "GCF.003350945.1.ASM335094v1.genomic", 
                            "GCF.001304735.1.ASM130473v1.genomic", "GCF.900478015.1.48269.B01.genomic", 
                            "GCF.003203455.1.ASM320345v1.genomic", "GCF.000013285.1.ASM1328v1.genomic", 
                            "GCF.900475545.1.44310.G02.genomic", "GCF.002312985.1.ASM231298v1.genomic", 
                            "GCF.001579765.1.ASM157976v1.genomic"),
           "C.baratii"=c("GCF.001991075.2.ASM199107v2.genomic", "GCF.000789395.1.ASM78939v1.genomic"),
           "C.butyricum"=c("GCF.001456065.2.ASM145606v2.genomic", "GCF.001465175.1.ASM146517v1.genomic"),
          "Outgroup"=c("GCF.000013425.1.ASM1342v1.genomic", "GCF.000009005.1.ASM900v1.genomic", 
                     "GCF.000007825.1.ASM782v1.genomic", "GCF.000008005.1.ASM800v1.genomic", 
                     "GCF.900130055.1.IMG-taxon.2585428084.annotated.assembly.genomic", 
                     "GCF.900092375.1.PRJEB146921.genomic", "GCF.002050515.1.ASM205051v1.genomic", 
                     "GCF.000833105.2.ASM83310v2.genomic", "GCF.900176305.1.IMG-taxon.2585428079.annotated.assembly.genomic", 
                     "GCF.000008765.1.ASM876v1.genomic", "GCF.003097175.1.ASM309717v1.genomic",
                     "GCF.000007625.1.ASM762v1.genomic", "GCF.001642655.1.ASM164265v1.genomic"))
tree = groupOTU(tree, cls)
p = ggtree(tree, lwd = 0.55,  aes(color=group), right = TRUE) + scale_color_manual(values = c("#009999","#FF66CC", "#9900FF", "#990033", "#FF6600", "#0036FF", "#009900","black")) + theme(legend.position = 'bottom', text = element_text(family = "avenir"))
plot(p)
ggsave("final_tree.png", device= "png", dpi=400)

##****NOTE: To remove branch.length and process dendrogram --> branch.length = 'none' 

#viewClade(p + geom_tiplab(),node = 74:44)
#p = ggtree(tree, right = TRUE) + geom_hilight(node=74:44, fill = "#006633", alpha = 0.08) #+ geom_tiplab(size = 1.75)
#plot(p + geom_cladelabel(node = 79, label = "group 1", color = "Red", barsize = 1))

##########################################
###Attach Heatmap or Binary to tip data###
##########################################

# binary = read.csv("/scicomp/home/opw9/bot_run_dir/final_set_dir/data_products_dir/r_work_dir/metabs.tsv", sep = "\t", stringsAsFactors = FALSE)
# binary$name
# binary$dpaL
# attach(binary)
# #colnames(binary) = c("dpaL", "aldH", "ptaB", "eutP")
# colnames(binary)
# row.names(binary) <- binary[,1]
# binary = binary[,2:5]
# rownames = binary[match(tree$tip.label, binary$name),]
# rownames
# #binary


metabs = read.table("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/r_work_dir/subunits_dir/metabolites_binary.tsv", sep = "\t", stringsAsFactors = F) # , fill = TRUE, quote = "")
colnames(metabs) <- sub("\\.", "", colnames(metabs))
#colnames(metabs) = c("name, dpaL", "aldH", "ptaB", "eutP")
metabs
metabs1.1 = metabs[,1:4]
metabs1.1
metabs2 = metabs[,5:8]
metabs2
metabs3 = metabs[,9:13]
metabs3
metabs4 = metabs[,14:19]
metabs4
metabs
rt = gheatmap(p, metabs1.1, width = .06, offset = 0.0275, colnames_angle = -80, hjust = 0, font.size = 1.3) %>%
  scale_x_ggtree() #+ theme(text = element_text(family = "Times"))
rt2 = gheatmap(rt, metabs2, width = .06, offset = 0.095, colnames_angle = -80, hjust = 0, font.size = 1.3) #+ theme(text = element_text(family = "Times"))
rt3 = gheatmap(rt2, metabs3, width = .075, offset = 0.16, colnames_angle = -80, hjust = 0, font.size = 1.3) #+ theme(text = element_text(family = "Times"))
rt4 = gheatmap(rt3, metabs4, width = .080 , offset = 0.24, colnames_angle = -80, hjust = 0, font.size = 1.3) #+ theme(text = element_text(family = "Times"))
rt4 = rt4 + scale_fill_manual(breaks = c("eutW", "eutV", "eutT1", "eutT2", "eutH", "pduB", "eutL", "eutN", "eutA", "eutB", "eutC", "aspA" ,"dpaL", "eutJ" , "eutE" , "aldH", "ptaB", "eutP", "eutQ"),
                              values = c("#003300", "#000099", "#000099", "#000099", "#000099", "#000099",
                                         "#003300", "#CC0000", "#003300", "#CC0000", "#CC0000", "#003300", 
                                         "#003300", "#FF9900", "#FF9900", "#FF9900","#CC0000" , "#003300", "#FF9900"))
rt4 = rt4 + theme( legend.text = element_text(size = 5),
                 legend.position = "left") + guides(fill = "none")  
rt4
ggsave("Figure_1.png", device = "png", dpi = 1200)


###############################
#Print Legend as Separate .png#
###############################

legend = get_legend(rt4)
as_ggplot(legend)
ggsave("legend.png",device = "png", dpi = 1200)


########################################################
#Reprint Figure_1 to exclude legend if using separately#
########################################################

rt4 = rt4 + theme(legend.text = element_text(size = 5),
                  legend.position = "none") + guides(fill = "none")  
rt4
ggsave("Figure_1.png", device = "png", dpi = 1200)


################################
#Print binary legend separately#
################################

binary_legend = plot(NULL ,xaxt='n',yaxt='n',bty='n',ylab='',xlab='', xlim=0:1, ylim=0:1)
legend("center", title = "Gene Function" ,legend =c('Regulation and Cofactors', 
                                                    'Transport and Microcompartment', 'Ammonia Lyase',
                            'Eut Intermediates'), pch=15, pt.cex=2, cex=0.85, bty='n',
       col = c('#FF9900', '#CC0000', '#000099', '#003300'), par(family = "avenir"))
png("bin.png", res = 1200)
dev.off()


###END###