#Rachel Yuan Nong Mikkelsen 2023MAR11

#mat_a <- rownames(mtx)
#mat_a <- as.data.frame(mat_a)
#mat_a[,2] <- sapply(strsplit(as.character(mat_a[,1]), "_"), function(x){x[1]})
#mat_a[,3] <- sapply(strsplit(as.character(mat_a[,1]), "_"), function(x){x[2]})
#mat_a[,4] <- sapply(strsplit(as.character(mat_a[,1]), "_"), function(x){x[3]})
#mat_a[,3] <- as.numeric(as.character(mat_a[,3]))
#mat_a[,4] <- as.numeric(as.character(mat_a[,4]))

#more_genes <- ref_human[match(more_genes, ref_human[,2], nomatch = 0),]
#more_genes[,5] <- as.numeric(as.character(more_genes[,5]))
#more_genes[,6] <- as.numeric(as.character(more_genes[,6]))

express_mat0_ <- matrix(-1, nrow = 1, ncol = 4)
express_mat0_ <- as.data.frame(express_mat0_)
colnames(express_mat0_) <- colnames(mat_a)
express_gene0_ <- -1
for(i in 1:dim(more_genes)[1]){
	key1_ <- as.character(more_genes[i, 4])
	mat0_ <- mat_a[which(mat_a[,2] == key1_),]
	mat0_ <- mat0_[which(mat0_[,3] >= more_genes[i,5] & mat0_[,3] <= more_genes[i,6]),]
	print(dim(mat0_))
	print(more_genes[i,])
	if(dim(mat0_)[1] !=0){
		express_mat0_ <- rbind(express_mat0_, mat0_)
		mat0_[,5] <- as.character(more_genes[i,2])
		express_gene0_ <- c(express_gene0_, as.character(mat0_[,5]))
		print(mat0_)
		print(express_gene0_)
	}
}
express_mat0_ <- unique(as.character(express_mat0_[,1]))
print("express_mat0_", "express_gene0_")


