#Rachel Yuan Nong Mikkelsen 2021-SEPT-22
#require 10x *_spatial_enrichment.csv

print("MORANs I for gene:")
more_gene <- readline()
more_gene <- as.character(more_gene)

par(cex = 0.5)
plot(data_10x_ffpe_st_human_tissue[,3], pch = 19, col = "red")
abline(h = data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene,3], col = "blue")
points(which(data_10x_ffpe_st_human_tissue[,2] == more_gene), data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene, 3], pch = 19, col = "blue")
text(which(data_10x_ffpe_st_human_tissue[,2] == more_gene), data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene, 3] + 0.1, col = "blue", label = more_gene)

filename = paste0(pre_fix, "__", more_gene, "__.pdf")

pdf(file = filename)
#par(cex = 0.5)
plot(data_10x_ffpe_st_human_tissue[,3], pch = 19, col = "red")
abline(h = data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene,3], col = "blue")
points(which(data_10x_ffpe_st_human_tissue[,2] == more_gene), data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene, 3], pch = 19, col = "blue")
text(which(data_10x_ffpe_st_human_tissue[,2] == more_gene), data_10x_ffpe_st_human_tissue[data_10x_ffpe_st_human_tissue[,2] == more_gene, 3] + 0.1, col = "blue", label = more_gene)
dev.off()
