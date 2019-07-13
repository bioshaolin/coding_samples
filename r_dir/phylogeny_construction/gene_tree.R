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


###################
###1st Gene Tree###
###################

eutP_tree = read.tree("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/tree_products_dir/pruned_gene_trees_dir/eutP.nw")
eutP_tree$tip.label 

  ###########################
  #Print node refernece tree#
  ###########################

eutP_nod_ref = ggtree(eutP_tree, lwd = 0.55, right = TRUE, layout = "circular", branch.length = "none") + geom_text2(aes(subset=!isTip, label=node), position = position_dodge(width = 0.9), hjust = -0.3, size =2.1)
plot(eutP_nod_ref)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/ref_figs_dir/eutP_node_reference.png", device = "png", dpi = 400)

  ###############################
  ##Specify Clade Reps Manually##
  ###############################

cls = list(Group_3=c("GCF.000014125.1.ASM1412v1.genomic" ,"GCF.003614235.1.ASM361423v1.genomic" ,
                     "GCF.001266905.1.ASM126690v1.genomic" ,"GCF.001266955.1.ASM126695v1.genomic" ,
                     "GCF.001267015.1.ASM126701v1.genomic" ,"GCF.001266895.1.ASM126689v1.genomic" ,
                     "GCF.000204375.2.V891.0.2.genomic" ,"GCF.001264545.1.ASM126454v1.genomic" ,
                     "GCF.001264605.1.ASM126460v1.genomic" ,"GCF.001264515.1.ASM126451v1.genomic" ,
                     "GCF.001267035.1.ASM126703v1.genomic" ,"GCF.001266995.1.ASM126699v1.genomic" ,
                     "GCF.001264505.1.ASM126450v1.genomic" ,"GCF.000204565.1.ASM20456v1.genomic" ,
                     "GCF.001264575.1.ASM126457v1.genomic" ,"GCF.001266965.1.ASM126696v1.genomic" ,
                     "GCF.001264475.1.ASM126447v1.genomic" ,"GCF.001266875.1.ASM126687v1.genomic" ,
                     "GCF.001264555.1.ASM126455v1.genomic" ,"GCF.001266885.1.ASM126688v1.genomic" ,
                     "GCF.001267045.1.ASM126704v1.genomic", "592027.CLG_B0726"),
           Group_1=c("GCF.000816965.1.ASM81696v1.genomic", "GCF.000503815.1.ASM50381v1.genomic", 
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
                     "CDC61111PL1-SN0054-18-003","GCF.001020205.1.ASM102020v1.genomic"), 
           Group_2=c("GCF.000750055.1.ASM75005v1.genomic", "GCF.000789355.1.ASM78935v1.genomic",
                     "GCF.000750065.1.ASM75006v1.genomic", "GCF.000307125.1.ASM30712v1.genomic",
                     "GCF.000020165.1.ASM2016v1.genomic", "GCF.000020285.1.ASM2028v1.genomic", 
                     "GCF.000827955.1.ASM82795v1.genomic", "GCF.000827935.1.ASM82793v1.genomic",
                     "CDC59470PL2-SN0054-18-013", "CDC59470PL2-SN0054-18-019", "CDC59471H2-SN0054-18-013",
                     "CDC59471H2-SN0054-18-020", "CDC42747PL1.TR3-SN0054-18-025"),
           Group_4=c("GCF.002074155.1.ASM207415v1.genomic"),
           C.perfringens=c("GCA.000013845.2.ASM1384v2.genomic", "GCF.002355795.1.ASM235579v1.genomic",
                           "GCF.001579785.1.ASM157978v1.genomic", "GCF.001854085.1.ASM185408v1.genomic",
                           "GCF.000009685.1.ASM968v1.genomic", "GCF.003350945.1.ASM335094v1.genomic", 
                           "GCF.001304735.1.ASM130473v1.genomic", "GCF.900478015.1.48269.B01.genomic", 
                           "GCF.003203455.1.ASM320345v1.genomic", "GCF.000013285.1.ASM1328v1.genomic", 
                           "GCF.900475545.1.44310.G02.genomic", "GCF.002312985.1.ASM231298v1.genomic", 
                           "GCF.001579765.1.ASM157976v1.genomic"),
           C.baratii=c("GCF.001991075.2.ASM199107v2.genomic", "GCF.000789395.1.ASM78939v1.genomic"),
           Outgroup=c("GCF.000013425.1.ASM1342v1.genomic", "GCF.000009005.1.ASM900v1.genomic", 
                      "GCF.000007825.1.ASM782v1.genomic", "GCF.000008005.1.ASM800v1.genomic", 
                      "GCF.900130055.1.IMG-taxon.2585428084.annotated.assembly.genomic", 
                      "GCF.900092375.1.PRJEB146921.genomic", "GCF.002050515.1.ASM205051v1.genomic", 
                      "GCF.000833105.2.ASM83310v2.genomic", "GCF.900176305.1.IMG-taxon.2585428079.annotated.assembly.genomic", 
                      "GCF.000008765.1.ASM876v1.genomic", "GCF.003097175.1.ASM309717v1.genomic",
                      "GCF.000007625.1.ASM762v1.genomic", "GCF.001642655.1.ASM164265v1.genomic", "526218.Sterm_1041", "523794.Lebu_0078", "1122173.AXVL01000005_gene298", "1227268.HMPREF1552_00938",
                      "634994.GCWU000323_02013", "1321774.HMPREF9108_01852", "1121289.JHVL01000006_gene2845",
                      "1211817.CCAT010000068_gene1347", "1033737.CAEV01000045_gene1323", "37659.JNLN01000001_gene478",
                      "1499689.CCNN01000004_gene160", "1230342.CTM_06266", "1410653.JHVC01000001_gene1697",
                      "1347392.CCEZ01000020_gene862", "572479.Hprae_0273", "431943.CKL_3420",
                      "545697.HMPREF0216_00325", "1499684.CCNP01000025_gene3684", "332101.JIBU02000012_gene962",
                      "1042163.BRLA_c025440", "1121121.KB894285_gene96", "1042163.BRLA_c026850",
                      "1121121.KB894289_gene2623", "697284.ERIC2_c10930", "1117108.PAALTS15_01827",
                      "1196323.ALKF01000170_gene668", "1385512.N784_13315", "1140002.I570_03281", "1158602.I590_00107",
                      "1158601.I585_00967", "33035.JPJF01000009_gene1396", "180332.JTGN01000006_gene3136",
                      "1499683.CCFF01000015_gene3102", "1280692.AUJL01000018_gene1005", "318464.IO99_04060",
                      "1391646.AVSU01000016_gene3222", "1408823.AXUS01000013_gene1233", "1476973.JMMB01000007_gene1647",
                      "1301100.HG529308_gene382", "272563.CD630_19090", "1151292.QEW_2334", "357809.Cphy_2648",
                      "642492.Clole_4094", "1280692.AUJL01000004_gene798", "195103.CPF_0887", "411469.EUBHAL_03260",
                      "1235835.C814_01596", "1235798.C817_01820", "742740.HMPREF9474_02453", "742741.HMPREF9475_03158",
                      "469618.FVAG_02286", "1319815.HMPREF0202_01029", "1408287.AXUR01000063_gene628", 
                      "457405.FSDG_02300", "469604.HMPREF0946_01807", "469606.FSCG_02033", "190304.FN0075",
                      "861452.HMPREF9093_02244", "1216362.B437_05660", "393480.FNP_0127", "1203605.HMPREF1531_00732",
                      "1111131.HMPREF1255_1038", "767029.HMPREF9154_2974", "754252.PFREUD_08980",
                      "1122994.AUFR01000004_gene677", "180332.JTGN01000001_gene4886", "2754.EH55_00830",
                      "457415.HMPREF1006_01431", "478749.BRYFOR_07179", "1123075.AUDP01000004_gene833",
                      "1226325.HMPREF1548_05036", "1123075.AUDP01000020_gene1473", "1203606.HMPREF1526_01221",
                      "1297617.JPJD01000068_gene2190", "411467.BACCAP_01535", "742738.HMPREF9460_02649",
                      "699248.SRA_04231", "1123300.AUIN01000010_gene13", "931626.Awo_c03740", "887929.HMP0721_0676",
                      "931626.Awo_c26580", "903814.ELI_0904", "580340.Tlie_0193", "592015.HMPREF1705_01671",
                      "891968.Anamo_0111", "584708.Apau_0012", "1304874.JAFY01000002_gene259", "469381.Dpep_1735",
                      "926567.TheveDRAFT_1593", "525903.Taci_0086", "1118057.CAGX01000059_gene321", "1123299.AUKZ01000009_gene1508", "1123312.KB904574_gene175", "1346.DQ08_01115",
                      "1321372.AQQB01000059_gene1835", "1158610.UC3_03127", "1158609.I586_01887", "1158612.I580_00554", "1158606.I579_00885", "1423775.BAMN01000004_gene1527", "1140002.I570_01104",
                      "1158602.I590_02000", "457421.CBFG_00663", "742733.HMPREF9469_00636", "357809.Cphy_1420",
                      "1304866.K413DRAFT_0573", "1163671.JAGI01000002_gene3461", "610130.Closa_4015",
                      "1298920.KI911353_gene4606", "1392487.JIAD01000001_gene676", "1117108.PAALTS15_09194",
                      "1196323.ALKF01000142_gene1488", "293826.Amet_3833", "913865.DOT_2441", "768706.Desor_5418", 
                      "768704.Desmer_4386", "1487923.DP73_18790", "696281.Desru_2085", "349161.Dred_3275",
                      "768710.DesyoDRAFT_5127", "1121428.DESHY_120084_1", "646529.Desaci_1573", "138119.DSY5002",
                      "756499.Desde_4194", "1347392.CCEZ01000008_gene2199", "864565.HMPREF0379_0300",
                      "1415775.U729_815", "350688.Clos_2395", "1499684.CCNP01000018_gene1942", "1415774.U728_134",
                      "536233.CLO_2325", "1499683.CCFF01000013_gene283", "1280689.AUJC01000006_gene2737",
                      "1211817.CCAT010000063_gene4082", "1033737.CAEV01000025_gene359", "1540257.JQMW01000013_gene848",
                      "318464.IO99_15725", "1443122.Z958_01180", "929506.CbC4_1731",
                      "536227.CcarbDRAFT_0417", "332101.JIBU02000003_gene4561", "445335.CBN_2164", "536232.CLM_2323",
                      "656519.Halsa_1002", "1293054.HSACCH_00274", "1410668.JNKC01000005_gene2389",
                      "1449050.JNLE01000003_gene2900", "887929.HMP0721_0180", "622312.ROSEINA2194_01704",
                      "1235799.C818_01093", "556261.HMPREF0240_02565", "1232453.BAIF02000079_gene43",
                      "397287.C807_00377", "658086.HMPREF0994_03041", "1226325.HMPREF1548_03651",
                      "411469.EUBHAL_01407", "411469.EUBHAL_01421", "411469.EUBHAL_02843", "411469.EUBHAL_01106",
                      "411902.CLOBOL_07234", "742735.HMPREF9467_03564", "1120746.CCNL01000017_gene2565",
                      "290402.Cbei_4063", "1294142.CINTURNW_0707", "536227.CcarbDRAFT_3331", "431943.CKL_3416",
                      "748727.CLJU_c17920", "180332.JTGN01000011_gene480", "931626.Awo_c28910", "903814.ELI_2952",
                      "742738.HMPREF9460_01168", "1297617.JPJD01000007_gene38", "693746.OBV_17670", 
                      "1235790.C805_03563", "397288.C806_00276", "397290.C810_01840", "1121428.DESHY_120084___1",
                      "1121434.AULY01000007_gene1120", "518637.EUBIFOR_01286", "NZ_CP011663.1_2090"))
eutP_tree = groupOTU(eutP_tree, cls)
 
  ##################################################
  ##Input ggplot/ggtree Display Parameters Manually#
  ## - circular, w/ branch.length = none           #
  ## - colored clades                              #
  ## - phylum classification                       #
  ##################################################

tr_eutP = ggtree(eutP_tree, lwd = 0.55,  aes(color=group), right = TRUE, layout = 'circular', branch.length = 'none') + scale_color_manual(values = c("#009999", "#9900FF", "#990033", "#FF6600", "#0033FF", "#009900","#000000")) #+ theme(legend.position = 'bottom', text = element_text(family = 'Times'))
tr_eutP = tr_eutP + xlim(0,30)
tr_eutP = tr_eutP + geom_cladelabel(node = 262,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 261, extend = 1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 295, label = "", align = T, color = "#6F4E37", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 301, extend = 0.6, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 317, hjust = 1, extend = 0.3 , label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 456, hjust = 1, extend = 0.1, label = "Fusobacteria", align = T, color = "#6F4E37", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 442, hjust = 1, extend = 0.1, label = "Actinobacteria", align = T, color = "#5B6E91", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 446, hjust = 1, extend = 0.1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutP = tr_eutP + geom_cladelabel(node = 349, hjust = 1, extend = 1, label = "Firmicutes", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)


plot(tr_eutP)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/intermediate_figs_dir/final_eutP_tree.png", device= "png", dpi=400)

  #####################################
  #Print Phylum classification legened#
  #####################################

eutP_legend = plot(NULL ,xaxt='n',yaxt='n',bty='n',ylab='',xlab='', xlim=0:1, ylim=0:1)
legend("center", title = "Phylum Classification" ,legend =c('Actinobacteria', 
                                                    'Firmicutes', 'Fusobacteria'
                                                    ), pch=15, pt.cex=2, cex=0.85, bty='n',
       col = c('#5B6E91', '#43464B', '#6F4E37'), par(family = "avenir"))
png("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/legends_dir/eutP_phyla_classification.png", res = 1200)
dev.off()

###################
###2nd Gene Tree###
###################

eutT_tree = read.tree("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/tree_products_dir/pruned_gene_trees_dir/eutT.nw")
eutT_tree$tip.label

  ###########################
  #Print node refernece tree#
  ###########################

eutT_nod_ref = ggtree(eutT_tree, lwd = 0.55, right = TRUE, layout = "circular", branch.length = "none") + geom_text2(aes(subset=!isTip, label=node), position = position_dodge(width = 0.9), hjust = -0.3, size =2.1)
plot(eutT_nod_ref)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/ref_figs_dir/eutT_node_reference.png", device = "png", dpi = 400)

  ###############################
  ##Specify Clade Reps Manually##
  ###############################

cls = list(Group_3=c("GCF.000014125.1.ASM1412v1.genomic" ,"GCF.003614235.1.ASM361423v1.genomic" ,
                     "GCF.001266905.1.ASM126690v1.genomic" ,"GCF.001266955.1.ASM126695v1.genomic" ,
                     "GCF.001267015.1.ASM126701v1.genomic" ,"GCF.001266895.1.ASM126689v1.genomic" ,
                     "GCF.000204375.2.V891.0.2.genomic" ,"GCF.001264545.1.ASM126454v1.genomic" ,
                     "GCF.001264605.1.ASM126460v1.genomic" ,"GCF.001264515.1.ASM126451v1.genomic" ,
                     "GCF.001267035.1.ASM126703v1.genomic" ,"GCF.001266995.1.ASM126699v1.genomic" ,
                     "GCF.001264505.1.ASM126450v1.genomic" ,"GCF.000204565.1.ASM20456v1.genomic" ,
                     "GCF.001264575.1.ASM126457v1.genomic" ,"GCF.001266965.1.ASM126696v1.genomic" ,
                     "GCF.001264475.1.ASM126447v1.genomic" ,"GCF.001266875.1.ASM126687v1.genomic" ,
                     "GCF.001264555.1.ASM126455v1.genomic" ,"GCF.001266885.1.ASM126688v1.genomic" ,
                     "GCF.001267045.1.ASM126704v1.genomic", "592027.CLG_B0726"),
           Group_1=c("GCF.000816965.1.ASM81696v1.genomic", "GCF.000503815.1.ASM50381v1.genomic", 
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
           Group_2=c("GCF.000750055.1.ASM75005v1.genomic", "GCF.000789355.1.ASM78935v1.genomic",
                     "GCF.000750065.1.ASM75006v1.genomic", "GCF.000307125.1.ASM30712v1.genomic",
                     "GCF.000020165.1.ASM2016v1.genomic", "GCF.000020285.1.ASM2028v1.genomic", 
                     "GCF.000827955.1.ASM82795v1.genomic", "GCF.000827935.1.ASM82793v1.genomic",
                     "CDC59470PL2-SN0054-18-013", "CDC59470PL2-SN0054-18-019", "CDC59471H2-SN0054-18-013",
                     "CDC59471H2-SN0054-18-020", "CDC42747PL1.TR3-SN0054-18-025"),
           Group_4=c("GCF.002074155.1.ASM207415v1.genomic"),
           C.perfringens=c("GCA.000013845.2.ASM1384v2.genomic", "GCF.002355795.1.ASM235579v1.genomic",
                           "GCF.001579785.1.ASM157978v1.genomic", "GCF.001854085.1.ASM185408v1.genomic",
                           "GCF.000009685.1.ASM968v1.genomic", "GCF.003350945.1.ASM335094v1.genomic", 
                           "GCF.001304735.1.ASM130473v1.genomic", "GCF.900478015.1.48269.B01.genomic", 
                           "GCF.003203455.1.ASM320345v1.genomic", "GCF.000013285.1.ASM1328v1.genomic", 
                           "GCF.900475545.1.44310.G02.genomic", "GCF.002312985.1.ASM231298v1.genomic", 
                           "GCF.001579765.1.ASM157976v1.genomic"),
           C.baratii=c("GCF.001991075.2.ASM199107v2.genomic", "GCF.000789395.1.ASM78939v1.genomic"),
           #C.butyricum=c("GCF.001456065.2.ASM145606v2.genomic", "GCF.001465175.1.ASM146517v1.genomic"),
           Outgroup=c("GCF.000013425.1.ASM1342v1.genomic", "GCF.000009005.1.ASM900v1.genomic", 
                      "GCF.000007825.1.ASM782v1.genomic", "GCF.000008005.1.ASM800v1.genomic", 
                      "GCF.900130055.1.IMG-taxon.2585428084.annotated.assembly.genomic", 
                      "GCF.900092375.1.PRJEB146921.genomic", "GCF.002050515.1.ASM205051v1.genomic", 
                      "GCF.000833105.2.ASM83310v2.genomic", "GCF.900176305.1.IMG-taxon.2585428079.annotated.assembly.genomic", 
                      "GCF.000008765.1.ASM876v1.genomic", "GCF.003097175.1.ASM309717v1.genomic",
                      "GCF.000007625.1.ASM762v1.genomic", "GCF.001642655.1.ASM164265v1.genomic", "526218.Sterm_1041", "523794.Lebu_0078", "1122173.AXVL01000005_gene298", "1227268.HMPREF1552_00938",
                      "1511.CLOST_0253","879308.HMPREF9130_0492","1410668.JNKC01000003_gene463","526218.Sterm_1045",
                      "634994.GCWU000323_02008","1227268.HMPREF1552_00942","1321774.HMPREF9108_00298",
                      "1122173.AXVL01000005_gene294","523794.Lebu_0074","469618.FVAG_02297",
                      "1319815.HMPREF0202_01040","1408287.AXUR01000063_gene639","457405.FSDG_02310",
                      "469606.FSCG_02043","469604.HMPREF0946_01797","393480.FNP_0138","1216362.B437_05610",
                      "190304.FN0085","1385512.N784_13365","1042163.BRLA_c026750","1121121.KB894289_gene2633",
                      "697284.ERIC2_c11030","1117108.PAALTS15_01777","1196323.ALKF01000170_gene678",
                      "683837.lse_1060","202752.JL53_06555","881621.LIV_1113","169963.lmo1181",
                      "1027396.LMOSA_20480","386043.lwe1139","272626.lin1145","1121344.JHZO01000003_gene928",
                      "1297617.JPJD01000021_gene1491","742738.HMPREF9460_02121","411467.BACCAP_00086",
                      "33035.JPJF01000009_gene1403","180332.JTGN01000006_gene3143","357809.Cphy_2640",
                      "642492.Clole_4086","318464.IO99_04110","1280692.AUJL01000018_gene997",
                      "1408823.AXUS01000013_gene1243","1301100.HG529308_gene371","1391646.AVSU01000016_gene3212",
                      "1476973.JMMB01000007_gene1657","272563.CD630_19190","1151292.QEW_2344",
                      "1280692.AUJL01000004_gene788","195103.CPF_0897","525903.Taci_0082",
                      "926567.TheveDRAFT_1597","1089553.Tph_c06990","563192.HMPREF0179_03164",
                      "1408428.JNJP01000045_gene1959","563192.HMPREF0179_00644","1408428.JNJP01000074_gene737",
                      "351348.Maqu_1230","493475.GARC_5339","1123367.C666_02590","95619.PM1_0214165",
                      "349965.yinte0001_3570","1453496.AT03_09345","61647.LG71_11865","1124991.MU9_1036",
                      "573.JG24_18490","637910.ROD_24071","1218086.BBNB01000012_gene1551","90371.CY43_13190",
                      "220341.16503683","571.MC52_28795","35703.DQ02_21605","1114922.CIFAM_01_01250",
                      "701347.Entcl_1308","693444.D782_1204","1080067.BAZH01000028_gene1275","469595.CSAG_02255",
                      "500640.CIT292_06059","1440052.EAKF1_ch3548","754331.AEME01000001_gene2747",
                      "362663.ECP_2471","199310.c2984","155864.EDL933_3613","316407.85675410","511145.b2459",
                      "469008.B21_02312","481805.EcolC_1218","349161.Dred_1300","1121472.AQWN01000001_gene60",
                      "635013.TherJR_0038","1423775.BAMN01000004_gene1525","1158610.UC3_03125",
                      "1321372.AQQB01000059_gene1837","1123299.AUKZ01000009_gene1506","1123312.KB904574_gene177",
                      "646529.Desaci_1574","138119.DSY5001","756499.Desde_4193","1121428.DESHY_120085_1",
                      "696281.Desru_2084","349161.Dred_3274","768710.DesyoDRAFT_5126","913865.DOT_2440",
                      "768706.Desor_5417","768704.Desmer_4385","1487923.DP73_18785","1117108.PAALTS15_09189",
                      "1196323.ALKF01000142_gene1487","293826.Amet_3832","1392487.JIAD01000001_gene675",
                      "864565.HMPREF0379_0299","1121434.AULY01000007_gene1119","1235798.C817_05353",
                      "457421.CBFG_00661","742733.HMPREF9469_00634","1163671.JAGI01000002_gene3459",
                      "357809.Cphy_1422","1304866.K413DRAFT_0571","610130.Closa_4013","1298920.KI911353_gene4604",
                      "350688.Clos_2394","1347392.CCEZ01000008_gene2198","748727.CLJU_c11900",
                      "748727.CLJU_c39810","1499684.CCNP01000018_gene1943","1415774.U728_135",
                      "536233.CLO_2324","1499683.CCFF01000013_gene284","1280689.AUJC01000006_gene2736",
                      "1415775.U729_814","1033737.CAEV01000025_gene358","1211817.CCAT010000063_gene4081",
                      "37659.JNLN01000001_gene1823","1443122.Z958_01185","592027.CLG_B0727","929506.CbC4_1730",
                      "318464.IO99_15730","332101.JIBU02000003_gene4562","536227.CcarbDRAFT_0418",
                      "1540257.JQMW01000013_gene847","NZ_CP011663.1_2089","536232.CLM_2322","445335.CBN_2163",
                      "1121428.DESHY_120085___1", "1118057.CAGX01000059_gene319", "1301100.HG529308_gene372", "1191523.MROS_0103",
                      "138119.DSY4964", "913865.DOT_2558", "768710.DesyoDRAFT_1645", "768706.Desor_1914",
                      "768706.Desor_1636", "768704.Desmer_1755", "1487923.DP73_19925", "1045858.Bint_1606",
                      "565034.BHWA1_00534", "1289135.A966_11372", "545695.TREAZ_1560", "1235835.C814_01590",
                      "742740.HMPREF9474_02459", "742741.HMPREF9475_03164", "1121289.JHVL01000006_gene2856",
                      "293826.Amet_0261", "1230342.CTM_06316", "1410653.JHVC01000001_gene1708",
                      "332101.JIBU02000012_gene972", "1033737.CAEV01000044_gene1492",
                      "1211817.CCAT010000068_gene1337", "37659.JNLN01000001_gene467",
                      "1499689.CCNN01000004_gene170", "1347392.CCEZ01000020_gene872",
                      "572479.Hprae_0283", "1226325.HMPREF1548_05043", "887929.HMP0721_1627",
                      "2754.EH55_00775", "1123075.AUDP01000020_gene1481", "457415.HMPREF1006_01440",
                      "478749.BRYFOR_07170", "1123075.AUDP01000004_gene824", "180332.JTGN01000001_gene4876",
                      "1203606.HMPREF1526_01210", "1297617.JPJD01000089_gene3138", "411467.BACCAP_01546",
                      "742738.HMPREF9460_02660", "1234679.BN424_443", "1304866.K413DRAFT_2744",
                      "1203605.HMPREF1531_00745", "926569.ANT_07250", "1346.DQ08_01125",
                      "1123308.KB904561_gene1946", "633147.Olsu_0308", "1125712.HMPREF1316_0471",
                      "1111121.HMPREF1247_0124", "742742.HMPREF9452_00745", "561177.ANHYDRO_00913",
                      "561177.ANHYDRO_00912", "655811.HMPREF0078_1370", "525255.HMPREF0077_1341",
                      "1118055.CAGU01000036_gene1389", "1121428.DESHY_120085_1"))
eutT_tree = groupOTU(eutT_tree, cls)

  ##################################################
  ##Input ggplot/ggtree Display Parameters Manually#
  ##################################################

tr_eutT = ggtree(eutT_tree, lwd = 0.55,  aes(color=group), right = TRUE, layout = 'circular', branch.length = 'none') + scale_color_manual(values = c("#000000","#009999", "#9900FF", "#990033", "#FF6600", "#0033FF", "#009900","#000000")) #+ theme(legend.position = 'bottom', text = element_text(family = 'Times'))
#tr_eutT = tr_eutT + geom_cladelabel(node = 262,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)


plot(tr_eutT)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/intermediate_figs_dir/final_eutT_tree.png", device= "png", dpi=400)


###################
###3rd Gene Tree###
###################

eutQ_tree = read.tree("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/tree_products_dir/pruned_gene_trees_dir/eutQ.nw")
eutQ_tree$tip.label

  ###########################
  #Print node refernece tree#
  ###########################

eutQ_nod_ref = ggtree(eutQ_tree, lwd = 0.55, right = TRUE, layout = "circular", branch.length = "none") + geom_text2(aes(subset=!isTip, label=node), position = position_dodge(width = 0.9), hjust = -0.3, size =3)
plot(eutQ_nod_ref)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/ref_figs_dir/eutQ_node_reference.png", device = "png", dpi = 400)


###############################
##Specify Clade Reps Manually##
###############################

cls = list(Group_3=c("GCF.000014125.1.ASM1412v1.genomic" ,"GCF.003614235.1.ASM361423v1.genomic" ,
                     "GCF.001266905.1.ASM126690v1.genomic" ,"GCF.001266955.1.ASM126695v1.genomic" ,
                     "GCF.001267015.1.ASM126701v1.genomic" ,"GCF.001266895.1.ASM126689v1.genomic" ,
                     "GCF.000204375.2.V891.0.2.genomic" ,"GCF.001264545.1.ASM126454v1.genomic" ,
                     "GCF.001264605.1.ASM126460v1.genomic" ,"GCF.001264515.1.ASM126451v1.genomic" ,
                     "GCF.001267035.1.ASM126703v1.genomic" ,"GCF.001266995.1.ASM126699v1.genomic" ,
                     "GCF.001264505.1.ASM126450v1.genomic" ,"GCF.000204565.1.ASM20456v1.genomic" ,
                     "GCF.001264575.1.ASM126457v1.genomic" ,"GCF.001266965.1.ASM126696v1.genomic" ,
                     "GCF.001264475.1.ASM126447v1.genomic" ,"GCF.001266875.1.ASM126687v1.genomic" ,
                     "GCF.001264555.1.ASM126455v1.genomic" ,"GCF.001266885.1.ASM126688v1.genomic" ,
                     "GCF.001267045.1.ASM126704v1.genomic", "592027.CLG_B0726"),
           Group_1=c("GCF.000816965.1.ASM81696v1.genomic", "GCF.000503815.1.ASM50381v1.genomic", 
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
           Group_2=c("GCF.000750055.1.ASM75005v1.genomic", "GCF.000789355.1.ASM78935v1.genomic",
                     "GCF.000750065.1.ASM75006v1.genomic", "GCF.000307125.1.ASM30712v1.genomic",
                     "GCF.000020165.1.ASM2016v1.genomic", "GCF.000020285.1.ASM2028v1.genomic", 
                     "GCF.000827955.1.ASM82795v1.genomic", "GCF.000827935.1.ASM82793v1.genomic",
                     "CDC59470PL2-SN0054-18-013", "CDC59470PL2-SN0054-18-019", "CDC59471H2-SN0054-18-013",
                     "CDC59471H2-SN0054-18-020", "CDC42747PL1.TR3-SN0054-18-025"),
           Group_4=c("GCF.002074155.1.ASM207415v1.genomic"),
           C.perfringens=c("GCA.000013845.2.ASM1384v2.genomic", "GCF.002355795.1.ASM235579v1.genomic",
                           "GCF.001579785.1.ASM157978v1.genomic", "GCF.001854085.1.ASM185408v1.genomic",
                           "GCF.000009685.1.ASM968v1.genomic", "GCF.003350945.1.ASM335094v1.genomic", 
                           "GCF.001304735.1.ASM130473v1.genomic", "GCF.900478015.1.48269.B01.genomic", 
                           "GCF.003203455.1.ASM320345v1.genomic", "GCF.000013285.1.ASM1328v1.genomic", 
                           "GCF.900475545.1.44310.G02.genomic", "GCF.002312985.1.ASM231298v1.genomic", 
                           "GCF.001579765.1.ASM157976v1.genomic"),
           C.baratii=c("GCF.001991075.2.ASM199107v2.genomic", "GCF.000789395.1.ASM78939v1.genomic"),
           #C.butyricum=c("GCF.001456065.2.ASM145606v2.genomic", "GCF.001465175.1.ASM146517v1.genomic"),
           Outgroup=c("1120999.JONM01000004_gene3602", "292415.Tbd_2363", "1123392.AQWL01000005_gene3102",
                      "1123393.KB891316_gene1689", "1163617.SCD_n00393", "323848.Nmul_A0437",
                      "1266925.JHVX01000003_gene690", "1288494.EBAPG3_3900", "228410.NE0701",
                      "335283.Neut_1160", "1131553.JIBI01000022_gene301", "153948.NAL212_0412",
                      "261292.Nit79A3_3243", "1121920.AUAU01000004_gene590", "661478.OP10G_0216",
                      "1485545.JQLW01000006_gene245", "314345.SPV1_01682", "1123368.AUIS01000026_gene1471",
                      "637389.Acaty_c1082", "637390.AFOH01000132_gene1888", "743299.Acife_2175",
                      "243159.AFE_0722", "380394.Lferr_0870", "694431.DESACE_09155",
                      "944479.JQLX01000014_gene1502", "944480.ATUV01000001_gene623", "760142.Hipma_1191",
                      "944481.JAFP01000001_gene1157", "1121918.ARWE01000001_gene1902", "156889.Mmc1_3647",
                      "1232410.KI421413_gene848", "177439.DP0889", "1121403.AUCV01000013_gene3930",
                      "1121382.JQKG01000018_gene1127", "926554.KI912663_gene1004", "937777.Deipe_0848",
                      "1121382.JQKG01000031_gene3681", "765420.OSCT_1947", "867845.KI911784_gene3111",
                      "1521187.JPIM01000029_gene1561", "324602.Caur_2585", "326427.Cagg_1280",
                      "709986.Deima_3102", "693977.Deipr_0367", "1489678.RDMS_12555",
                      "684949.ATTJ01000001_gene2205", "1121378.KB899696_gene2816", "745776.DGo_CA2414",
                      "243230.DR_0567", "1288484.APCS01000086_gene1584", "546414.Deide_04330", "1121380.JNIW01000008_gene1622", "1121381.JNIV01000083_gene122", "1121377.KB906406_gene178", "1476583.DEIPH_ctg023orf0020", "319795.Dgeo_1794", "1540221.JQNI01000002_gene1865", "903818.KI912268_gene932",
                      "857087.Metme_1135", "243233.MCA0354", "1123502.AQXD01000002_gene312", "1111732.AZOD01000006_gene54",
                      "1121948.AUAC01000004_gene212", "1123059.KB823012_gene2099", "998674.ATTE01000001_gene2694",
                      "870187.Thini_1553", "1123401.JHYQ01000008_gene341", "1123399.AQVE01000014_gene132",
                      "1123400.KB904746_gene1206", "2340.JV46_12220", "1049564.TevJSym_ak00940", "631362.Thi970DRAFT_01765",
                      "765912.Thimo_1188", "765910.MARPU_01935", "768671.ThimaDRAFT_1417", "765913.ThidrDRAFT_0813", 
                      "1249627.D779_0134", "572477.Alvin_2212", "765911.Thivi_3675", "1469245.JFBG01000015_gene1015",
                      "472759.Nhal_0536", "105559.Nwat_0450", "323261.Noc_2666", "1286106.MPL1_11518", "754476.Q7A_2966",
                      "1026882.MAMP_01023", "754477.Q7C_1282", "396588.Tgr7_2774", "713586.KB900536_gene2588",
                      "765914.ThisiDRAFT_0180", "519989.ECTPHS_02721", "713587.THITH_11515", "1255043.TVNIR_1040",
                      "545276.KB898724_gene1767", "1266909.AUAG01000048_gene683", "748658.KB907313_gene2131",
                      "1269813.ATUL01000003_gene2462", "545264.KB898750_gene233", "396595.TK90_0549",
                      "1279019.ARQK01000054_gene177", "1158150.KB906241_gene1333", "1158760.AQXP01000046_gene298", "1158756.AQXQ01000012_gene1608",
                      "1158165.KB898875_gene76", "1266908.AQPB01000010_gene920", "1158146.KB907122_gene419",
                      "1266914.ATUK01000012_gene312", "1158182.KB905021_gene380", "1158762.KB898047_gene631",
                      "187272.Mlg_0087", "349124.Hhal_1177", "314278.NB231_04540", "1260251.SPISAL_08085",
                      "1335757.SPICUR_09060", "1033802.SSPSH_002811", "1304275.C41B8_10103",
                      "1415780.JPOG01000001_gene2286", "1122603.ATVI01000010_gene1053",
                      "1122604.JONR01000007_gene2912", "1415779.JOMH01000001_gene1529",
                      "1123261.AXDW01000019_gene715", "1123256.KB907938_gene598", "1123257.AUFV01000002_gene2338",
                      "1502724.FF80_00857", "1082931.KKY_683", "1535287.JP74_01825", "1297865.APJD01000006_gene4327",
                      "1230476.C207_04885", "398525.KB900701_gene6948", "438753.AZC_1193", "420324.KI911955_gene3742",
                      "864069.MicloDRAFT_00069170", "1429916.X566_00785", "1101190.ARWB01000001_gene1921", "395965.Msil_1820",
                      "633149.Bresu_0963", "391600.ABRU01000050_gene339", "1229204.AMYY01000006_gene1093",
                      "588932.JHOF01000027_gene1755", "1035191.HMPREF0185_02113", "426117.M446_3288", "460265.Mnod_5252",
                      "272630.MexAM1_META1p3241", "419610.Mext_3032", "648885.KB316283_gene4172", "441620.Mpop_3223",
                      "1096546.WYO_4546", "693986.MOC_0792", "426355.Mrad2831_0627", "1101192.KB910516_gene2092",
                      "1101191.KI912577_gene2195", "1131813.AQVT01000001_gene658", "269482.Bcep1808_5153",
                      "1396141.BATP01000019_gene1585", "794903.OPIT5_26425", "278957.ABEA03000186_gene1532",
                      "349741.Amuc_0585", "1123070.KB899250_gene557", "382464.ABSI01000012_gene1966",
                      "583355.Caka_2756", "1077974.GOEFS_081_00010", "408672.NBCG_03792", "883067.HMPREF9237_00376",
                      "1120933.ATUY01000010_gene1524", "649743.HMPREF0972_00572", "1227261.HMPREF0043_01471",
                      "68570.DC74_1594", "994479.GL877878_gene975", "525245.HMPREF0044_1204", "883069.HMPREF9238_00462", "1219581.HMPREF1628_04250", "1403948.Q618_VCMC00001G0571", "1123488.ATUF01000009_gene1474", "1403948.Q618_VCMC00001G0570",
                      "1120946.AUBF01000004_gene1531", "1118058.CAGY01000001_gene226", "1284680.HMPREF1627_09145",
                      "888050.HMPREF9004_1611", "883077.HMPREF9241_01021", "1120947.ATUX01000007_gene1009",
                      "1120942.AUBM01000004_gene2004", "888052.HMPREF9006_0479", "936548.HMPREF1136_1683",
                      "1203556.HMPREF1478_01176", "411466.ACTODO_01741", "1105029.HMPREF1137_1872",
                      "1321775.HMPREF1980_01691", "1123065.ATWL01000005_gene1239", "585530.HMPREF0183_2278", 
                      "1176165.CAJD01000009_gene379", "1033736.CAHK01000023_gene1781", "1229781.C272_15852", "321955.AAGP01000008_gene643", "1381751.JAJB01000026_gene1246", "1121017.AUFG01000009_gene1560", "1035308.AQYY01000001_gene1959", "1121933.AUHH01000011_gene2670", "1111131.HMPREF1255_1782", "1203605.HMPREF1531_01699", "1120954.ATXE01000001_gene2235", "767029.HMPREF9154_2677", "1410634.JHVD01000009_gene1820", "754252.PFREUD_03750", "1122994.AUFR01000034_gene1192", "1210046.B277_01989", "110319.CF8_0373", "2045.KR76_23620", "935866.JAER01000010_gene4113", "1121385.AQXW01000004_gene2900", "1274.HX89_13615", "188626.HMPREF0321_0661", "397278.JOJN01000002_gene764", "570268.ANBB01000068_gene2443", "405948.SACE_4356", "1068980.ARVW01000001_gene4877", "1068978.AMETH_4390", "1137271.AZUM01000001_gene1439", "471857.Svir_23350", "1114959.SZMC14600_18609", "928724.SacglDRAFT_02643", "882082.SaccyDRAFT_3138", "882086.SacxiDRAFT_3865", "1122622.ATWJ01000013_gene157", "1043205.AFYF01000010_gene1436", "1123251.ATWM01000009_gene2907", "1184607.AUCHE_08_00340", "1089455.MOPEL_002_00010", "1184609.KILIM_028_00240", "1445613.JALM01000112_gene332", "1306174.JODP01000001_gene5403", "1283283.ATXA01000026_gene3683", "1123023.JIAI01000002_gene4747", "1123024.AUII01000010_gene767", "2074.JNYD01000012_gene457", "675635.Psed_5217", "479435.Kfla_0271", "1122138.AQUZ01000052_gene8403", "40571.JOEA01000004_gene6290", "1120948.KB903240_gene3821", "477641.MODMU_5312", "1380393.JHVP01000023_gene3293", "1380356.JNIK01000003_gene1247", "1146883.BLASA_3411", "1211815.CBYP010000073_gene3664", "266940.Krad_3353", "1032480.MLP_02390", "287986.DV20_16320", "749927.AMED_1634", "1089545.KB913037_gene6111", "208444.JNYY01000010_gene2800", "208439.AJAP_08010", "1125971.ASJB01000017_gene6119", "330084.JNYZ01000016_gene5424", "591158.SSMG_01293", "1089544.KB912942_gene4628", "396014.BF93_18160", "1074488.AGBX01000005_gene2609", "446465.Bfae_09210", "1064537.AGSO01000009_gene2132", "479431.Namu_5343", "443218.AS9A_1379", "1448389.BAVQ01000003_gene3433", "1278078.G419_07849", "1449069.JMLO01000024_gene2574", "1268303.RHODMAR_2824", "1828.JOKB01000025_gene1871", "685727.REQ_27520", "1323361.JPOC01000009_gene1724", "234621.RER_35270", "37919.EP51_37655", "101510.RHA1_ro01065", "1273125.Rrhod_0144", "1435356.Y013_05650", "1240349.ANGC01000055_gene4006", "1429046.RR21198_4827", "1206732.BAGD01000061_gene2180", "1206733.BAGC01000026_gene4762", "1206741.BAFX01000061_gene5189", "1206731.BAGB01000031_gene1693", "1056816.JAFQ01000004_gene4322", "1206744.BAGL01000038_gene495", "1160137.KB907307_gene3148", "1206743.BAGM01000053_gene1322", "1415166.NONO_c23960", "1206720.BAFQ01000071_gene1893", "1133849.O3I_011990", "1206729.BAFZ01000046_gene5211", "1169152.AXVD01000015_gene1164", "1206737.BAGF01000032_gene1845", "1110697.NCAST_18_00130", "1206735.BAGG01000042_gene1915", "247156.NFA_18070", "1206730.BAGA01000062_gene2432", "1206725.BAFU01000044_gene2081", "1127134.NOCYR_1923", "1206726.BAFV01000025_gene1855", "426716.JOAJ01000008_gene4847", "1206739.BAGJ01000068_gene5778", "1449068.JMLQ01000004_gene1436", "640132.Srot_1131", "679197.HMPREF9336_00854", "1077144.AGFF01000008_gene216", "1292020.H483_0103925", "1121370.AQUY01000002_gene1954", "1111729.ATYV01000006_gene1388", "1287475.HMPREF1650_08060", "553204.CORAM0001_1083", "1487956.DR71_268", "883169.HMPREF9719_00233", "191610.CATYP_07190", "1121355.KB903375_gene1552", "1224164.B843_08825", "698964.CDPW8_1568", "553207.HMPREF0299_6793", "1719.CPTC_01954", "945712.CULC22_01492", "196164.23493867", "196627.cg2334", "1121353.H924_08950", "548477.HMPREF0294_1706", "1125779.HMPREF1219_00929", "1121360.AUAQ01000011_gene539", "1121356.AQUW01000007_gene613", "1348662.CARG_06340", "1035195.HMPREF9997_01615", "1121367.AQXC01000001_gene1636", "1203622.HMPREF1290_01379", "649754.HMPREF0281_00072", "1285583.CCASEI_05665", "548476.cauri_1638", "525268.HMPREF0308_0989", "525264.HMPREF0305_12320", "1203567.HMPREF1286_01519", "525260.HMPREF0276_1913", "1203566.HMPREF1285_00426", "1203632.HMPREF1300_01217", "1121365.AQXB01000001_gene1017", "1121362.A605_09310", "1224163.B841_08640", "558173.CDOO_09280", "1121363.KB902204_gene1131", "1121366.KB892438_gene671", "585529.HMPREF0291_11288", "1401064.HMPREF2129_00880", "1232427.CAVS020000023_gene150", "1414719.CBYN010000006_gene1269", "156978.CIMIT_08040", "525263.HMPREF0298_1250", "1121354.AQUV01000001_gene1515", "1203190.CAJP01000002_gene1867", "521096.Tpau_1991", "1151061.CAJY01000028_gene1185", "468556.AQYG01000048_gene712", "258052.JNYV01000007_gene2845", "1172185.KB911510_gene1328", "1121927.GOHSU_02_00420", "1223542.GM1_004_00510", "1121928.AUHE01000011_gene1257", "644548.SCNU_06560", "1223544.GSI01S_06_01910", "1223545.GS4_30_00810", "1089453.GOSPT_058_00730", "1220583.GOACH_16_01020", "1112204.GPOL_c27490", "1108045.GORHZ_073_00320", "526226.Gbro_2990", "1075090.GOAMR_40_00100", "1223543.GP2_001_00270", "1027371.GOALK_002_01890", "1386969.AWTB01000117_gene98", "2055.JNXA01000003_gene4319", "337191.KTR9_2985", "1123258.AQXZ01000012_gene2073", "36809.MAB_2691c", "1172186.KB911471_gene2770", "1449048.JQKU01000021_gene1853", "931627.MycrhDRAFT_5049", "1440774.Y900_000445", "875328.JDM601_2169", "1370120.AUWR01000054_gene2938", "47839.CCAU010000009_gene1553", "1408452.JAGZ01000009_gene2946", "525368.HMPREF0591_0451", "44454.NF84_14485", "262316.MAP_1264", "487521.OCU_30520", "1041522.MCOL_V223378", "1265310.CCBD010000031_gene1773", "216594.MMAR_2374", "362242.MUL_1550", "272631.ML1209", "83332.Rv1559", "419947.MRA_1571", "557599.MKAN_27720", "1299327.I546_2333", "1380386.JIAW01000011_gene3283", "258533.BN977_03433", "700508.D174_13690", "350054.Mflv_3634",
                      "1370125.AUWT01000025_gene5627", "1194972.MVAC_19723", "710421.Mycch_2505", "318424.EU78_12700",
                      "350058.Mvan_2783", "164757.Mjls_3103", "1150599.MPHLEI_01796", "1122247.C731_2201",
                      "710686.Mycsm_02940", "710685.MycrhN_5246", "710687.KI912270_gene1283", "1078020.KEK_00400",
                      "1209984.BN978_07115", "1370121.AUWS01000008_gene5705", "1157943.KB892705_gene1456",
                      "1120797.KB908259_gene1057", "246196.MSMEI_3101", "1298864.AUEQ01000007_gene2026",
                      "547163.BN979_02705", "1341646.CBMO010000084_gene71", "1042375.AFPL01000032_gene973",
                      "1499967.BAYZ01000182_gene4476", "929556.Solca_1885", "1449336.JQLO01000001_gene2264", "1234679.BN424_3600", "1449338.JQLU01000005_gene2072", "1497679.EP56_04235",
                      "1552123.EP57_09040", "1265845.PWEIH_13939", "525367.HMPREF0556_11042", "683837.lse_1973", "202752.JL53_11035", "881621.LIV_1972", "169963.lmo1991", "1027396.LMOSA_29060", "386043.lwe2010", "272626.lin2098", "458233.MCCL_0857", "1179226.AJXO01000092_gene614", "1167632.AJTR01000027_gene1830", "1232666.JANE01000027_gene1389", "1220551.SCHR_07813", "985762.SAGN_11845",
                      "1078083.HMPREF1208_01372", "984892.SPSE_0768", "1141106.CAIB01000046_gene358", "1229783.C273_09467", "396513.SCA_1567", "1405498.SSIM_09790", "904314.SEVCU012_1129", "861530.ALOZ01000073_gene1558", "1159488.SEQMU2_08015", "1288.SXYLSMQ121_0845", "342451.SSP0817", "698737.SLGD_00961", "1034809.SLUG_09990", "279808.SH0972", "435837.HMPREF0798_01865", "629742.STAHO0001_0125", "176279.SERP1673", "176280.SE_1662", "1234593.ANBY01000087_gene377", "596319.STAWA0001_0260", "1194526.A284_04135", "1280.SAXN108_2306", "435838.HMPREF0786_02174", "525378.HMPREF0793_0145", "1408438.JADD01000014_gene594", "655812.HMPREF0061_0677", "1175629.AJTG01000031_gene1617", "203120.LEUM_1956", "1229758.C270_07115", "1423807.BACO01000017_gene544", "913848.AELK01000084_gene433", "1423806.JCM15457_1632", "525318.HMPREF0497_1659", "797515.HMPREF9103_01572", "1423815.BACR01000039_gene1945", "1423734.JCM14202_2948", "1158609.I586_01643", "1158608.I583_01934", "1158612.I580_00250", "1140003.I573_02059", "888064.HMPREF9088_1973", "565653.EGBG_01150", "565655.ECBG_01829", "1139996.OMQ_01555", "679897.HMU11800", "1121864.OMO_00833", "1121865.OMW_00958", "1139219.I569_00111", "1158606.I579_02053", "1158607.UAU_03840", "1158602.I590_03829", "1158614.I592_01752", "1140002.I570_03636", "1158601.I585_00023", "1215915.BN193_03690", "272623.L0081", "416870.llmg_1276", "1123309.AQYB01000021_gene87", "1214166.ALLG01000004_gene452",
                      "1321372.AQQB01000014_gene603", "1214217.ALNF01000004_gene853",
                      "996306.SSUR61_1745", "391295.SSU05_1885", "1214184.ALKY01000036_gene78",
                      "1123314.AUIO01000009_gene308", "1123315.AUIP01000006_gene345", "764298.STRMA_1814",
                      "1123303.AQVD01000005_gene1218", "210007.SMU_234", "1198676.SMUGS5_00900", "699248.SRA_09883", "1123300.AUIN01000014_gene956", "873449.STRCR_0623", "904293.HMPREF9176_0088", "264199.stu0150", "322159.STER_0204", "904306.HMPREF9192_0247", "435842.HMPREF0848_01479", "1046629.Ssal_02023", "1116231.SMA_0337", "1069533.Sinf_0291", "525379.HMPREF0819_1687", "1123304.AQYA01000030_gene1227",
                      "1123298.KB904097_gene282", "1123311.KB904449_gene242", "467705.SGO_0529", "469609.HMPREF0847_00527",
                      "1123307.KB904398_gene75", "176090.SSIN_0845", "889201.HMPREF9422_1818", "1302863.I872_08580",
                      "888816.HMPREF9389_0127", "888808.HMPREF9380_1874", "388919.SSA_1967", "888821.HMPREF9394_0515", 
                      "888833.HMPREF9421_0022", "999425.HMPREF9186_01633", "888048.HMPREF8577_1944", "1114965.Spaf_0512",
                      "1316408.HSISM1_308", "585204.SMSK597_0044", "1095727.HMPREF1117_0537", "1095737.HMPREF1110_1299",
                      "585202.SMSK321_1673", "563038.HMPREF0851_00946", "1035187.HMPREF9959_0692", "1054460.SPPN_02790",
                      "1008453.HMPREF9957_1651", "585203.SMSK564_1236", "246201.SM12261_0839", "365659.smi_1822", "170187.SP_0450",
                      "171101.spr0406", "373153.SPD_0409", "864567.HMPREF8571_0425", "861455.HMPREF9184_00387",
                      "1095726.HMPREF1116_0481", "888746.HMPREF9180_0342", "1203590.HMPREF1481_00965",
                      "1005705.HMPREF9967_1653", "1035189.HMPREF9954_0508", "889204.HMPREF9423_0251", "997830.HMPREF1124_0768",
                      "936580.HMPREF1516_0095", "1095738.HMPREF1047_0044", "1282664.H354_06081", "864570.HMPREF9189_1434",
                      "1005704.HMPREF9968_1336", "1282665.H353_02135", "927666.SOR_1677", "888049.HMPREF8578_0809",
                      "655813.HMPREF8579_0110", "1419814.V470_08255", "1000588.HMPREF9965_0557", "1297534.CAUJ01000002_gene1397",
                      "768726.HMPREF9178_0966", "563037.HMPREF0850_01495", "1297857.CAUK01000004_gene1580", "929713.NIASO_19410",
                      "1122605.KB893630_gene4034", "1216967.L100_12319", "172045.KS04_15510", "1338011.BD94_3407",
                      "485918.Cpin_1924", "1267211.KI669560_gene153", "925409.KI911562_gene550", "1123248.KB893359_gene2136",
                      "700598.Niako_0107", "468059.AUHA01000004_gene2067", "1358423.N180_09360", "391596.PBAL39_23302",
                      "1270196.JCKI01000003_gene1780", "1408813.AYMG01000028_gene2595", "1454007.JAUG01000034_gene3840",
                      "1150600.ADIARSV_4323", "509635.N824_15940", "485917.Phep_3429", "714943.Mucpa_4475", "743722.Sph21_2278", "762903.Pedsa_2360", "1122621.ATZA01000025_gene2404",
                      "1229276.DI53_1241", "1346330.M472_07240", "1538644.KO02_20365", "525373.HMPREF0766_11218",
                      "1550091.JROE01000009_gene375", "926549.KI421517_gene730", "869213.JCM21142_394", "929703.KE386491_gene3363",
                      "649349.Lbys_2830", "761193.Runsl_0753", "1434325.AZQN01000005_gene3526", "471854.Dfer_3678",
                      "1121481.AUAS01000014_gene2348", "929562.Emtol_1800", "1185876.BN8_06127", "504472.Slin_5911",
                      "1166018.FAES_4922", "1089547.KB913013_gene2951", "1123277.KB893176_gene3828", "1123276.KB893249_gene529",
                      "1123278.KB893554_gene3975", "1121904.ARBP01000005_gene4659", "1122176.KB903547_gene1107",
                      "1122179.KB890415_gene2038", "243090.RB5151", "1121930.AQXG01000004_gene2968", "1237149.C900_01878",
                      "313606.M23134_02134", "2754.EH55_00050", "457415.HMPREF1006_02220", "926556.Echvi_3354",
                      "1121859.KB890759_gene1943", "1227739.Hsw_2945", "1279009.ADICEAN_02826", "1121957.ATVL01000007_gene1896",
                      "1461577.CCMH01000004_gene1152", "172045.KS04_12205", "865938.Weevi_0075", "172045.KS04_04995",
                      "307480.IW16_26435", "1120951.AUBG01000001_gene794", "402612.FP0445", "1416760.AYMS01000005_gene3409",
                      "1121896.JMLU01000018_gene2863", "1341181.FLJC2902T_24710", "1218108.KB908293_gene1354",
                      "391598.FBBAL38_11429", "1094466.KQS_05850", "1034807.FBFL15_0830", "1450525.JATV01000012_gene3049",
                      "1492737.FEM08_07310", "1121887.AUDK01000005_gene3018", "1492738.FEM21_18880", "991.IW20_04320", 
                      "1229487.AMYW01000013_gene3756", "1144313.PMI10_01887", "1453505.JASY01000013_gene4335", "1270193.JARP01000007_gene265", "362418.IW19_13940", "1202532.FF52_15489", "376686.Fjoh_1906", "1506583.JQJY01000009_gene1062",
                      "927658.AJUM01000040_gene833"))
           eutQ_tree = groupOTU(eutQ_tree, cls)

##################################################
##Input ggplot/ggtree Display Parameters Manually#
##################################################

tr_eutQ = ggtree(eutQ_tree, lwd = 0.55,  aes(color=group), right = TRUE, layout = 'circular', branch.length = 'none') + scale_color_manual(values = c("#000000", "#009999", "#9900FF", "#990033", "#FF6600", "#0033FF", "#009900")) #+ theme(legend.position = 'bottom', text = element_text(family = 'Times'))
tr_eutQ = tr_eutQ + xlim(0,33)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 441,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 443,extend = 1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 445,extend = 1, label = "Firmicutes", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 824,extend = 4, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 729,extend = 1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 524,extend = 1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 731,extend = 1, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 823,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
#tr_eutQ = tr_eutQ + geom_cladelabel(node = 523,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 809, hjust = 1, extend = 0.2, label = "Fusobacteria", align = T, color = "#6F4E37", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 743,extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.6)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 528, hjust = 1, extend = 0.2, label = "Deinococcus", align = T, color = "#8BB381", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 538, hjust = 1, extend = 0.2, label = "", align = T, color = "#E77471", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 575, hjust = 1, extend = 0.2, label = "", align = T, color = "#5B6E91", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 543, hjust = 1, extend = 0.2, label = "", align = T, color = "#E77471", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 581, hjust = 1, extend = 0.2, label = "Spirochaetes", align = T, color = "#7E587E", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 720, hjust = 1, extend = 0.2, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 664, hjust = 1, extend = 0.2, label = "", align = T, color = "#E77471", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 667, hjust = -0.2, extend = 0.2, label = "Actinobacteria", align = T, color = "#5B6E91", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 632, hjust = 1, extend = 0.4, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 662, hjust = 1, extend = 0.8, label = "", align = T, color = "#43464B", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 637, hjust = -0.05, extend = 0.8, label = "Proteobacteria", align = T, color = "#E77471", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)
tr_eutQ = tr_eutQ + geom_cladelabel(node = 585, hjust = -0.05, extend = 0.8, label = "", align = T, color = "#E77471", offset.text = 1.0, barsize = 1.25, family = "avenir", fontsize = 2.4)

           
plot(tr_eutQ)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/intermediate_figs_dir/final_eutQ_tree.png", device= "png", dpi=400)

  
###################
###4th Gene Tree###
###################

eutN_tree = read.tree("/scicomp/home/opw9/bot_run_dir/final_set_dir/v1.1_dir/data_products_dir/tree_products_dir/pruned_gene_trees_dir/eutN_1.4.nw")
eutN_tree$tip.label

###############################
##Specify Clade Reps Manually##
###############################

cls = list(Group_3=c("GCF.000014125.1.ASM1412v1.genomic" ,"GCF.003614235.1.ASM361423v1.genomic" ,
                     "GCF.001266905.1.ASM126690v1.genomic" ,"GCF.001266955.1.ASM126695v1.genomic" ,
                     "GCF.001267015.1.ASM126701v1.genomic" ,"GCF.001266895.1.ASM126689v1.genomic" ,
                     "GCF.000204375.2.V891.0.2.genomic" ,"GCF.001264545.1.ASM126454v1.genomic" ,
                     "GCF.001264605.1.ASM126460v1.genomic" ,"GCF.001264515.1.ASM126451v1.genomic" ,
                     "GCF.001267035.1.ASM126703v1.genomic" ,"GCF.001266995.1.ASM126699v1.genomic" ,
                     "GCF.001264505.1.ASM126450v1.genomic" ,"GCF.000204565.1.ASM20456v1.genomic" ,
                     "GCF.001264575.1.ASM126457v1.genomic" ,"GCF.001266965.1.ASM126696v1.genomic" ,
                     "GCF.001264475.1.ASM126447v1.genomic" ,"GCF.001266875.1.ASM126687v1.genomic" ,
                     "GCF.001264555.1.ASM126455v1.genomic" ,"GCF.001266885.1.ASM126688v1.genomic" ,
                     "GCF.001267045.1.ASM126704v1.genomic", "592027.CLG_B0726", "929506.CbC4_1728",
                     "592027.CLG_B0729", "1443122.Z958_01195"),
           Group_1=c("CDC61111PL1-SN0054-18-003", "GCF.000816965.1.ASM81696v1.genomic", "GCF.000503815.1.ASM50381v1.genomic", 
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
                     "GCF.001020205.1.ASM102020v1.genomic",  "445335.CBN_2160", "NZ_CP011663.1_2086", "536232.CLM_2319"), 
           # Group_2=c("GCF.000750055.1.ASM75005v1.genomic", "GCF.000789355.1.ASM78935v1.genomic",
           #            "GCF.000750065.1.ASM75006v1.genomic", "GCF.000307125.1.ASM30712v1.genomic",
           #            "GCF.000020165.1.ASM2016v1.genomic", "GCF.000020285.1.ASM2028v1.genomic", 
           #            "GCF.000827955.1.ASM82795v1.genomic", "GCF.000827935.1.ASM82793v1.genomic",
           #            "CDC59470PL2-SN0054-18-013", "CDC59470PL2-SN0054-18-019", "CDC59471H2-SN0054-18-013",
           #            "CDC59471H2-SN0054-18-020", "CDC42747PL1.TR3-SN0054-18-025","536232.CLM_2319"),
           # #Group_4=c("GCF.002074155.1.ASM207415v1.genomic"),
           C.perfringens=c("GCA.000013845.2.ASM1384v2.genomic", "GCF.002355795.1.ASM235579v1.genomic",
                           "GCF.001579785.1.ASM157978v1.genomic", "GCF.001854085.1.ASM185408v1.genomic",
                           "GCF.000009685.1.ASM968v1.genomic", "GCF.003350945.1.ASM335094v1.genomic", 
                           "GCF.001304735.1.ASM130473v1.genomic", "GCF.900478015.1.48269.B01.genomic", 
                           "GCF.003203455.1.ASM320345v1.genomic", "GCF.000013285.1.ASM1328v1.genomic", 
                           "GCF.900475545.1.44310.G02.genomic", "GCF.002312985.1.ASM231298v1.genomic", 
                           "GCF.001579765.1.ASM157976v1.genomic"),
           C.baratii=c("GCF.001991075.2.ASM199107v2.genomic", "GCF.000789395.1.ASM78939v1.genomic"),
           #C.butyricum=c("GCF.001456065.2.ASM145606v2.genomic", "GCF.001465175.1.ASM146517v1.genomic"),
           Outgroup=c("1449126.JQKL01000004_gene577", "484770.UFO1_1124", "1009370.ALO_06793", 
                      "1120985.AUMI01000014_gene931", "484770.UFO1_1104", "1122947.FR7_0547", 
                      "913865.DOT_6155", "555079.Toce_0558", "656519.Halsa_0993", "1293054.HSACCH_00263",
                      "635013.TherJR_0628", "469617.FUAG_00590", "469618.FVAG_00504",
                      "1408287.AXUR01000012_gene2237", "457405.FSDG_02010", "393480.FNP_2123",
                      "1216362.B437_02901", "386415.NT01CX_0487", "332101.JIBU02000032_gene3029",
                      "536227.CcarbDRAFT_3777", "748727.CLJU_c07100", "431943.CKL_0849", "536227.CcarbDRAFT_1063",
                      "1487921.DP68_09900", "903814.ELI_4074", "931626.Awo_c25800", "887929.HMP0721_1971",
                      "1203605.HMPREF1531_00718", "1111131.HMPREF1255_1050", "767029.HMPREF9154_2988",
                      "754252.PFREUD_09110", "1122994.AUFR01000004_gene664", "693746.OBV_17640", "1235790.C805_03557",
                      "397288.C806_00282", "397290.C810_01834", "742738.HMPREF9460_01159", "1297617.JPJD01000007_gene29",
                      "536233.CLO_2023", "1415774.U728_417", "1121289.JHVL01000040_gene3151",
                      "1347392.CCEZ01000049_gene1469", "634956.Geoth_1937", "1034347.CAHJ01000009_gene1917",
                      "699218.HMPREF0889_1222", "1000569.HMPREF1040_1364", "997350.HMPREF9129_0373",
                      "908338.HMPREF9286_0817", "1033744.CAEL01000022_gene324", "796940.HMPREF9628_01356",
                      "864565.HMPREF0379_0311", "944564.HMPREF9200_0635", "500633.CLOHIR_00406",
                      "1120746.CCNL01000017_gene2557", "1294142.CINTURNW_0716", "290402.Cbei_4055",
                      "1121296.JONJ01000001_gene1581", "1280692.AUJL01000001_gene195", "1163671.JAGI01000002_gene3569",
                      "411902.CLOBOL_07242", "742735.HMPREF9467_03556", "202752.JL53_06465", "386043.lwe1121",
                      "169963.lmo1163", "272626.lin1127", "1027396.LMOSA_20300", "683837.lse_1041", "881621.LIV_1095",
                      "1158601.I585_00952", "1140002.I570_03267", "1158602.I590_00092", "701521.PECL_1373",
                      "557436.Lreu_1738", "387344.LVIS_1979", "387344.LVIS_1606", "1449337.JQLL01000001_gene1023",
                      "1302286.BAOT01000003_gene419", "913848.AELK01000071_gene2491", "1114972.AUAW01000006_gene2462",
                      "1423815.BACR01000011_gene723", "1423747.BAMJ01000012_gene984", "319224.Sputcn32_0201",
                      "595494.Tola_1695", "1224318.DT73_23065", "527002.yaldo0001_10560", "393305.YE2739",
                      "28152.DJ57_1799", "1205683.CAKR01000010_gene3340", "349965.yinte0001_21830", "349966.DJ58_3545",
                      "469595.CSAG_01859", "754331.AEME01000001_gene32", "502347.ESCAB7627_2297", "637910.ROD_21351",
                      "1114922.CIFAM_04_00630", "1218086.BBNB01000001_gene3912", "701347.Entcl_1748", "35703.DQ02_14520",
                      "571.MC52_03035", "90371.CY43_11060", "573.JG24_20585", "500640.CIT292_06529",
                      "1080067.BAZH01000025_gene3360", "469381.Dpep_1749", "584708.Apau_0025",
                      "1304874.JAFY01000002_gene273", "580340.Tlie_0207", "592015.HMPREF1705_01657", "891968.Anamo_0125",
                      "1408422.JHYF01000002_gene2330", "1128398.Curi_c29040", "1391646.AVSU01000038_gene1996",
                      "1476973.JMMB01000007_gene1606", "350688.Clos_0371", "293826.Amet_4575", "857293.CAAU_1163",
                      "865861.AZSU01000002_gene2688", "1347392.CCEZ01000074_gene1880", "246194.CHY_0688",
                      "1034769.KB910518_gene240", "1536772.R70723_28175", "1536773.R70331_27240", "1536769.P40081_32630",
                      "160799.PBOR_31295", "698769.JFBD01000019_gene1984", "1121090.KB894693_gene2481",
                      "665959.HMPREF1013_03867", "1196031.ALEG01000008_gene5061", "1307436.PBF_20598",
                      "935836.JAEL01000013_gene4531", "1121430.JMLG01000004_gene933", "1121087.AUCK01000005_gene726",
                      "1131730.BAVI_09046", "406124.ACPC01000022_gene4198", "1340434.AXVA01000008_gene3703",
                      "502025.Hoch_5814", "215803.DB30_1142", "1191523.MROS_0182", "517418.Ctha_2617",
                      "1519464.HY22_07270", "1191523.MROS_0098", "234267.Acid_0322", "1191523.MROS_0104",
                      "880073.Calab_3436", "1541960.KQ78_01066", "1499967.BAYZ01000013_gene6419",
                      "445972.ANACOL_01083", "1232443.BAIA02000040_gene2145", "1184609.KILIM_086_00040",
                      "1203605.HMPREF1531_00752", "926569.ANT_07150", "196162.Noca_4036", "1304865.JAGF01000001_gene1149",
                      "420662.Mpe_B0502", "189753.AXAS01000067_gene5070", "1206731.BAGB01000168_gene1339",
                      "37919.EP51_05290", "479431.Namu_2346", "675635.Psed_2090", "1123024.AUII01000002_gene1041", "1391647.AVSV01000002_gene1317", "545697.HMPREF0216_00321", "1499684.CCNP01000025_gene3688", "1410628.JNKS01000027_gene924", "1408323.JQKK01000003_gene2761", "138119.DSY4963", "913865.DOT_2556", "768706.Desor_1916", "768704.Desmer_1757", "1487923.DP73_20735", "768704.Desmer_1608", "768710.DesyoDRAFT_1647", "1487923.DP73_19935", "768706.Desor_1638", "1511.CLOST_0680", "1196323.ALKF01000201_gene2960", "439292.Bsel_3110", "986075.CathTA2_2113", "1123009.AUID01000024_gene1439", "748224.HMPREF9436_00773", "1298920.KI911353_gene2003", "1304866.K413DRAFT_3311", "610130.Closa_1825", "742740.HMPREF9474_02457", "1235835.C814_01592", "742741.HMPREF9475_03162", "526218.Sterm_1048", "1227268.HMPREF1552_00945", "523794.Lebu_0071", "1122173.AXVL01000005_gene291", "634994.GCWU000323_02005", "1321774.HMPREF9108_00295", "1410668.JNKC01000003_gene465", "887929.HMP0721_1625", "1226325.HMPREF1548_05046", "1123075.AUDP01000004_gene820", "478749.BRYFOR_07166", "411467.BACCAP_01550", "742738.HMPREF9460_02664", "1297617.JPJD01000097_gene2154", "1203606.HMPREF1526_01206", "2754.EH55_00755", "457415.HMPREF1006_01444", "1089553.Tph_c07020", "880073.Calab_3249", "1340434.AXVA01000008_gene3680", "1340434.AXVA01000014_gene525", "1234664.AMRO01000035_gene2634",
                      "1122927.KB895416_gene3367", "1243664.CAVL020000005_gene361", "1380763.BG53_02465", "1449063.JMLS01000011_gene202", "1501230.ET33_24490", "1007103.AFHW01000122_gene648", "1122915.AUGY01000033_gene938", "1118054.CAGW01000081_gene2613", "1444309.JAQG01000097_gene4153", "1408254.T458_27785", "1444309.JAQG01000076_gene4562", "358681.BBR47_56210", "1200792.AKYF01000027_gene626", "1132442.KB889752_gene1368", "933115.GPDM_10480", "1027292.HMPREF9372_2517", "1123290.AUDQ01000004_gene421", "1347368.HG964408_gene7142", "1145276.T479_08295", "714961.BFZC1_03683", "1285586.H131_10008", "714961.BFZC1_11487", "649747.HMPREF0083_06117", "1121091.AUMP01000025_gene2497", "1196324.A374_04274", "1340434.AXVA01000017_gene4136", "545693.BMQ_3675", "1211814.CAPG01000014_gene518", "1499680.CCFE01000021_gene2138", "935836.JAEL01000024_gene2439", "665959.HMPREF1013_03590", "1196031.ALEG01000065_gene66", "1121344.JHZO01000003_gene925", "1297617.JPJD01000021_gene1494", "411467.BACCAP_00083", "742738.HMPREF9460_02124", "33035.JPJF01000009_gene1406", "180332.JTGN01000006_gene3146", "642492.Clole_4083", "357809.Cphy_2637", "1408823.AXUS01000013_gene1247", "1301100.HG529308_gene368", "1391646.AVSU01000016_gene3209", "1476973.JMMB01000007_gene1660", "272563.CD630_19220", "1151292.QEW_2347", "1280692.AUJL01000004_gene785", "195103.CPF_0900", "318464.IO99_04125", "1280692.AUJL01000018_gene994", "1499683.CCFF01000015_gene3092", "1123489.AUAN01000013_gene1384", "1140002.I570_03826", "1300150.EMQU_2200", "565653.EGBG_01932", "1201292.DR75_622", "226185.EF_1619", "1042163.BRLA_c026720", "1121121.KB894289_gene2636", "697284.ERIC2_c11060", "1117108.PAALTS15_01762", "1196323.ALKF01000170_gene681", "1385512.N784_13380", "1462527.CCDM010000005_gene4744", "1042163.BRLA_c025340", "1121121.KB894285_gene106", "332101.JIBU02000012_gene975", "525903.Taci_0079", "926567.TheveDRAFT_1600", "1347392.CCEZ01000020_gene876", "293826.Amet_0265", "865861.AZSU01000003_gene1998", "1105031.HMPREF1141_2891", "1121334.KB911069_gene1671", "572479.Hprae_0287", "1121289.JHVL01000006_gene2860", "1230342.CTM_06336",
                      "1410653.JHVC01000001_gene1712", "879308.HMPREF9130_0489", "1033737.CAEV01000044_gene1488", "1211817.CCAT010000068_gene1333", "1499689.CCNN01000004_gene174", "37659.JNLN01000001_gene463", "1319815.HMPREF0202_01043", "1045858.Bint_1602", "1289135.A966_11352", "305900.GV64_00505", "526222.Desal_0476", "1121451.DESAM_21362", "207559.Dde_3273", "525146.Ddes_1365", "1121445.ATUZ01000013_gene1104", "469618.FVAG_02300", "635013.TherJR_0041", "1121472.AQWN01000001_gene61", "349161.Dred_1301", "768710.DesyoDRAFT_4531", "138119.DSY0412", "756499.Desde_0360", "1408287.AXUR01000063_gene641", "469604.HMPREF0946_01795", "469606.FSCG_02045", "457405.FSDG_02312", "190304.FN0087", "393480.FNP_0140", "1216362.B437_05600", "525255.HMPREF0077_1344", "655811.HMPREF0078_1367", "1118055.CAGU01000036_gene1386", "633147.Olsu_0311", "1125712.HMPREF1316_0468",
                      "742742.HMPREF9452_00742", "1111121.HMPREF1247_0121", "1121434.AULY01000007_gene1116", "1118057.CAGX01000059_gene316", "1499684.CCNP01000018_gene1946", "1392487.JIAD01000001_gene672", "1235798.C817_05356", "457421.CBFG_00658", "742733.HMPREF9469_00631", "1117108.PAALTS15_09174", "1196323.ALKF01000142_gene1484", "1511.CLOST_0259", "1121428.DESHY_120088_1", "138119.DSY4998", "756499.Desde_4190", "349161.Dred_3271", "646529.Desaci_1577", "696281.Desru_2081", "768710.DesyoDRAFT_5123", "913865.DOT_2437", "768706.Desor_5414", "768704.Desmer_4382", "1487923.DP73_18770", "357809.Cphy_1425", "1163671.JAGI01000002_gene3456", "1304866.K413DRAFT_0568", "1298920.KI911353_gene4601", "610130.Closa_4010", "1347392.CCEZ01000008_gene2195", "748727.CLJU_c11930", "748727.CLJU_c39780", "536233.CLO_2321", "1415774.U728_138", "1499683.CCFF01000013_gene287", "1280689.AUJC01000006_gene2733", "293826.Amet_3829", "332101.JIBU02000003_gene4565", "536227.CcarbDRAFT_0421", "1415775.U729_811", "1211817.CCAT010000063_gene4078", "37659.JNLN01000001_gene1826", "318464.IO99_15745",
                      "1033737.CAEV01000025_gene355", "1540257.JQMW01000013_gene844",
                      "439235.Dalk_4990", "1121403.AUCV01000053_gene2633", "411469.EUBHAL_00516", "1188256.BASI01000001_gene1474", "272942.RCAP_rcc02203", "316056.RPC_1172", "1111728.ATYS01000062_gene639", "269796.Rru_A0912", "1116375.VEJY3_08475", "199310.c4528", "1115512.EH105704_20_00370", "343509.SG1884", "1286170.RORB6_03655", "561231.Pecwa_4100", "1166016.W5S_4259", "382464.ABSI01000020_gene270", "452637.Oter_1294", "278957.ABEA03000086_gene2506", "794903.OPIT5_04215", "344747.PM8797T_14771", "756272.Plabr_4076", "1123242.JH636435_gene1237", "521674.Plim_1753", "243090.RB2581",
                      "595460.RRSWK_05732", "575540.Isop_1629", "886293.Sinac_1770",
                      "314230.DSM3645_04945", "530564.Psta_3283", "1499967.BAYZ01000013_gene6422", "215803.DB30_2247", "502025.Hoch_4425", "1541960.KQ78_01068", "445972.ANACOL_01079", "1232443.BAIA02000040_gene2149", "1121087.AUCK01000005_gene731", "1340434.AXVA01000008_gene3708", "406124.ACPC01000022_gene4193", "1131730.BAVI_09021", "1191523.MROS_0097", "880073.Calab_3435", "234267.Acid_0323", "1191523.MROS_0181", "517418.Ctha_2618", "1519464.HY22_07265", "243090.RB2571", "595460.RRSWK_05728", "756272.Plabr_4082", "314230.DSM3645_04925", "530564.Psta_3287", "344747.PM8797T_14746", "521674.Plim_1748", "1123242.JH636435_gene1241", "382464.ABSI01000020_gene273", "575540.Isop_1632", "886293.Sinac_1766",
                      "452637.Oter_1297",
                      "278957.ABEA03000086_gene2503", "794903.OPIT5_04230", "272134.KB731324_gene5459", "1173263.Syn7502_00607", "395961.Cyan7425_1616", "864702.OsccyDRAFT_3153", "329726.AM1_5382", "1173020.Cha6605_4352", "317619.ANKN01000173_gene1237", "1140.Synpcc7942_1422", "269084.syc0134_c", "56110.Oscil6304_2004", "927677.ALVU02000001_gene2442", "118173.KB235911_gene155", "32057.KB217478_gene6239", "1165094.RINTHH_18840", "1173021.ALWA01000008_gene1582", "221288.JH992901_gene1762", "373994.Riv7116_2789", "1469607.KK073768_gene3884", "211165.AJLN01000117_gene2921", "1337936.IJ00_15980", "1173023.KE650771_gene2240", "1174528.JH992898_gene1456", "98439.AJLL01000061_gene598", "306281.AJLK01000013_gene4913", "63737.Npun_F4293", "56107.Cylst_3897", "99598.Cal7507_0758", "643473.KB235930_gene3882", "46234.ANA_C12559", "533240.CRC_00970", "533247.CRD_00506", "272123.Anacy_0483", "163908.KB235896_gene2044", "313624.NSP_40330", "28072.Nos7524_5038", "103690.17130211", "240292.Ava_4470", "317936.Nos7107_0843", "551115.Aazo_1863", "1170562.Cal6303_0693", "1173026.Glo7428_0667", "388467.A19Y_1118", "313612.L8106_23311", "459495.SPLC1_S220080", "696747.NIES39_K04810", "1173028.ANKO01000020_gene5503", "1173022.Cri9333_1589", "203124.Tery_3850", "251221.35212661", "1183438.GKIL_0663", "1487953.JMKF01000067_gene3859", "82654.Pse7367_1591", "1173025.GEI7407_0412", "402777.KB235898_gene5596", "179408.Osc7112_5170", "756067.MicvaDRAFT_0631", "489825.LYNGBM3L_26640", "118168.MC7420_6863", "1173027.Mic7113_4195", "251229.Chro_1008", "582515.KR51_00019910", "13035.Dacsa_1764", "65093.PCC7418_3533", "1128427.KB904821_gene2794", "1173029.JH980292_gene3070", "111780.Sta7437_0336", "102125.Xen7305DRAFT_00044730", "1541065.JRFE01000019_gene3088", "118161.KB235922_gene691", "111781.Lepto7376_0175", "32049.SYNPCC7002_A1801", "1407650.BAUB01000012_gene2097", "497965.Cyan7822_2896", "65393.PCC7424_1370", "118163.Ple7327_0309", "449447.MAE_47920", "41431.PCC8801_1598", "43989.cce_4281", "391612.CY0110_13371", "292563.Cyast_0226", "113355.CM001775_gene269",
                      "755178.Cyan10605_0826", "102232.GLO73106DRAFT_00033970",
                      "1147.D082_28040", "1148.1651847", "195250.CM001776_gene917",
                      "321327.CYA_1613", "321332.CYB_1795", "1158609.I586_00561", "1234679.BN424_446", "202752.JL53_06570", "386043.lwe1142", "683837.lse_1063", "881621.LIV_1116", "1027396.LMOSA_20510", "272626.lin1148", "169963.lmo1184", "699248.SRA_04306", "1123300.AUIN01000009_gene400", "350688.Clos_0806", "610130.Closa_1505", "1304866.K413DRAFT_2747", "888048.HMPREF8577_0389", "888833.HMPREF9421_1292", "999425.HMPREF9186_00082", "1123308.KB904550_gene496", "388919.SSA_0529", "888808.HMPREF9380_0492",
                      "888816.HMPREF9389_1064", "888821.HMPREF9394_1942", "1121428.DESHY_120088___1"))
eutN_tree = groupOTU(eutN_tree, cls)

##################################################
##Input ggplot/ggtree Display Parameters Manually#
##################################################

tr_eutN = ggtree(eutN_tree, lwd = 0.55,  aes(color=group), right = TRUE, layout = 'circular', branch.length = 'none') + scale_color_manual(values = c("#009999", "#9900FF","#990033","#0033FF", "#000000")) #+ theme(legend.position = 'bottom', text = element_text(family = 'Times'))
plot(tr_eutN)
ggsave("/scicomp/home/opw9/eut_manuscript_dir/figures_dir/intermediate_figs_dir/final_eutN_tree.png", device= "png", dpi=400)




##############################################
###Arrange Gene Trees in Comparative Figure###
##############################################

fig <- ggarrange(tr_eutP,tr_eutQ,tr_eutT,tr_eutN, ncol = 2, nrow = 2, labels = c("eutP", "eutQ" , "eutT", "eutN"), common.legend = TRUE, legend = "none", font.label = list(size=9,color= "#000000", face = "bold", family = NULL)) #+ theme(legend.position = 'bottom', text = element_text(family = 'Times'))
fig
ggsave("Figure_2.png", device= "png", dpi=400)

