brine <- read.csv(" Desktop/abundance_brine.csv", sep=",")
brine
row.names(brine) <- brine[,1]
brine <- brine[,2:5]
brine_matrix <- data.matrix(brine)
#add.alpha <- function(col, alpha=0.05)
colors <- colorRampPalette(brewer.pal(9,"PuRd"))(100)
brine_heatmap <- heatmap(brine_matrix, Rowv=NA,Colv=NA,col = colors, scale="column", margins=c(8,20), cexCol=1.2, cexRow=0.0000000000000001)
row.names(brine)

display.brewer.pal(9,"PuRd")

