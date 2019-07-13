### call .csv with genome_stats

genome_size<- read.csv("/Volumes/base_1/Users/erikgetz/Downloads/brine/summary_output_brine.csv", sep=",")
gm <- data.frame(t(genome_size[-1]))
colnames(gm) <- genome_size[,1]
genome_size
attach(genome_size)
completeness
id

### S = alpha(1-beta)/ gamma where: alpha = base_pairs, beta = contamination, gamma = completeness

top = base_pairs*(1-(contaminiation/100))
#top
bottom = completeness / 100
#bottom
size = top / bottom
size

# Check figure alignment

#barplot(genome_size$completeness, names.arg = genome_size$id, horiz=TRUE, las=2, cex.names = 0.45) 

# Size barplot

barplot(size, horiz=TRUE, axes=FALSE,width =200, space =0.25, offset = 1, col = c("#666666"))
