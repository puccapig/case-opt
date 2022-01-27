#Rachel Yuan Nong Mikkelsen 2022-JANUARY-25
#for example vary grab_ to (10, 100, 1000) for two genes and then use a  smaller gene table instead of entire gene table in cluster step:  

LD_gene_from_genome <- function(){
	ref_human <- read.csv("__genes.csv", header = FALSE)
	more_genes <- read.csv(more_genes)
	more_genes <- as.character(more_genes[,2])
	print("USE [ensemble]1 or [abbr.]2:")
	inx_ <- readline()
	inx_ <- as.numeric(inx_)
	more_genes <- ref_human[match(more_genes, ref_human[,inx_], nomatch = 0),]
	
	print("BY [number of]#genes:")
	grab_ <- readline()
	grab_ <- as.numeric(grab_)
	
	ld_gene_table <- matrix(0, ncol = dim(ref_human)[2], nrow = 1)
	ld_gene_table <- as.data.frame(ld_gene_table)
	for(i in 1:dim(more_genes)[1]){
		ki <- more_genes[i,]
		region_ki <- ref_human[ref_human[,4] == as.character(unlist(ki[4])), ]
		region_ki[,5] <- as.numeric(as.character(unlist(region_ki[,5])))
		region_ki <- region_ki[order(region_ki[,5]),]
		
		ii <- which(region_ki[,2] == as.character(unlist(ki[2])))
		ii_left <- ii - grab_
		ii_right <- ii + grab_
		if(ii_left < 0){ 
			ii_left <- 1
			ii_right <- ii_left + grab_ + grab_
			}
		if(ii_right > dim(region_ki)[1]){
			ii_right <- dim(region_ki)[1]
			ii_left <- ii_right - grab_ - grab_
			}
		ld_gene1 <- region_ki[ii_left:ii_right, ]
		ld_gene_table <- rbind(ld_gene_table, ld_gene1)
	}
		ld_gene_table <- ld_gene_table[2:dim(ld_gene_table)[1],]
		write.csv(ld_gene_table, file = "ld_gene_table.csv")
		print(dim(ld_gene_table))
		print("ld_gene_table.csv")
}




	
