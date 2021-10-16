#Rachel Yuan Nong Mikkelsen 2021-OCT-16
#patch＿eel|spatial

#source("~.mat.cpm.R")
#cpm_mat <- norm.log.mat(mat)

cluster_by_cutree <- read.csv("~tsne_3k_.csv")
cluster_by_cutree <- cluster_by_cutree[,2:dim(cluster_by_cutree)[2]]
my_tsne_cpm_mat_k3 <- cluster_by_cutree
cluster_by_cutree <- cutree(hclust(dist(cluster_by_cutree)), k = 15)

factor_name <- cluster_by_cutree
factor_name <- paste0(factor_name, "_")
source("~assign_legend_text_and_color.r")
source("~format_to_st.r")
cols.by.cluster_cutree_k15.st <- format.mat.to.st(cols.by.input)

#par(cex = 0.7)
#plot(tissue_position[,6], -tissue_position[,5], col = cols.by.cluster_cutree_k15.st[,1])
#source("RN2021OCT15-ave_tools_st_10x_tissue_pos_.r")


#a <- c("ENSMUSG00000027270", "ENSMUSG00000005716", "ENSMUSG00000019772")
#a <- read.csv("more_genes.csv")
a <- as.character(a[,2])
matrix_out <- cpm_mat[match(a, rownames(cpm_mat), nomatch = 0),]
matrix_out <- matrix_out[, match(tissue_by_edge_pts[,1], colnames(matrix_out), nomatch = 0)]

cutree_matrix_out <- cutree(hclust(dist(t(matrix_out))), k = 3)
cutree_matrix_out_1 <- cluster_by_cutree[match(colnames(matrix_out), colnames(cpm_mat), nomatch = 0)]
cutree_matrix_out <- as.data.frame(cutree_matrix_out)
rownames(cutree_matrix_out) <- colnames(matrix_out)
cluster_by_cutree <- as.data.frame(cluster_by_cutree)
rownames(cluster_by_cutree) <- colnames(cpm_mat)
cluster_by_cutree <- as.data.frame(cluster_by_cutree)
cluster_by_cutree[,2] <- cluster_by_cutree[,1]

for(i in 1:dim(cutree_matrix_out)[1]){
a <- rownames(cutree_matrix_out)[i]
cluster_by_cutree[a,2] <- cutree_matrix_out[i,1] + 15
}

factor_name <- cluster_by_cutree[,2]
factor_name <- paste0(factor_name, "_")
source("~assign_legend_text_and_color.r")
cols.by.stare_features.st <- format.mat.to.st(cols.by.input)
par(cex = 0.7)
plot(tissue_position[,6], -tissue_position[,5], col = cols.by.stare_features.st[,1], pch = 19)
#title(sub = "Lamp5, Pvalb, Vip | 10x_Adult_Mouse_Brain")
