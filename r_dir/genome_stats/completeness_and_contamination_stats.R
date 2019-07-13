df = read.csv("/scicomp/home/opw9/bot_run_dir/final_set_dir/data_products_dir/checkm_out.tsv", sep = "\t", row.names = 1, header = 1)
names
df2 <- data.frame(t(df[-1]))
colnames(df2)<- df[,1]
df
attach(df)
comp

df$Colour = "black"
df$Colour[df$comp>=85]= c("#000733")
df$Colour[df$comp<=84.999]= c("#990000")
plot(comp, ylim=c(50,100), col=df$Colour, xlab = "Reps" , panel.first = grid(3, lty = 1, lwd = 2),axes=TRUE, pch = 20, cex = 0.83)

               