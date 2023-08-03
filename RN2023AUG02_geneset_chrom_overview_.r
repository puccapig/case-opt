#Rachel Yuan Nong Mikkelsen 2023AUG01
#overview for genesets by chromosome coor.

source(".../ref_human_table.r")

b <- c(1:22)
b <- as.matrix(b)
b <- c(b, "X", "Y")

chromosome_ <- matrix(0, ncol = 3, nrow = 1)
chromosome_ <- as.data.frame(chromosome_)
for(fi in 1:24){
	chr_ <- paste0("chr", b[fi])
	geneset_ <- ref_human[which(ref_human[,4] == chr_),]
	geneset_[,5] <- as.numeric(as.character(geneset_[,5]))
	chromosome_[fi, 1] <- chr_
	chromosome_[fi, 2] <- min(geneset_[,5])
	chromosome_[fi, 3] <- max(geneset_[,5])
}

show_gene_table <- matrix(0, nrow = 1, ncol = 3)
show_gene_table <- as.data.frame(show_gene_table)
show_gene_table[1:24,1] <- paste0("chr", b)
show_gene_table[1:24,2] <- paste0("_", b)
show_gene_table[1:24,3] <- chromosome_[,2]

show_gene_ <- read.csv("more_genes.csv")
show_gene_ <- ref_human[match(show_gene_[,2], ref_human[,2], nomatch = 0),]
show_gene_ <- cbind(as.character(show_gene_[,4]), as.character(show_gene_[,2]), as.character(show_gene_[,5]))
show_gene_[,3] <- as.numeric(as.character(show_gene_[,3]))

if(dim(show_gene_)[1] > 100){
        o <- sample(c(1:dim(show_gene_)[1]), 100)
        show_gene_ <- show_gene_[o,]
}

show_gene_table <- rbind(show_gene_table, show_gene_)
show_gene_table[,3] <- as.numeric(as.character(show_gene_table[,3]))
show_gene_table <- show_gene_table[order(show_gene_table[,3], decreasing = TRUE),]

pdf(file = "1.pdf", height = 10)
par(mfrow = c(4, 6), cex = 0.5)
for(fi in 1:24){
	par(cex = 0.5)
	start_ <- 1
	#to_ <- round(log10(chromosome_[fi, 3]))+1
	to_ <- chromosome_[fi,3]
	aa <- c(start_:to_)
	bb <- aa
	bb[start_:to_] <- c(1)
	
	ui <- sample(start_:to_, 10)
	aa <- aa[ui]
	bb <- bb[ui]
	
	chr_ <- paste0("chr", b[fi])
	print(paste0(">>>>>>>>>>>>", chr_))
	plot(bb, aa, xlim = c(0, 2), ylim = c(start_, to_), col = "white", ylab = "position", xlab = chr_)
	abline(v = 1, col = "purple")
	
	text1_ <- log10(show_gene_table[which(show_gene_table[,1] == chr_), 3]+1)
	text2_ <- c(1:length(text1_))
	text2_n <- length(text2_)
	for(ti in 1:text2_n){
		text2_[ti] <- ti*(2/text2_n)
	}	

	#text2_[1:length(text2_)] <- 1.4
	#abline(h = log10(show_gene_table[which(show_gene_table[,1] == chr_), 3]+1), col = "red")
	abline(h = show_gene_table[which(show_gene_table[,1] == chr_), 3]+1, col = "red")
	par(cex = 0.3)
	#text(text2_, text1_, col = "blue", labels = show_gene_table[which(show_gene_table[,1] == chr_), 2])
	legend("bottomright", legend = show_gene_table[which(show_gene_table[,1] == chr_), 2], text.col = "blue", bty = "n")
	}
dev.off()

