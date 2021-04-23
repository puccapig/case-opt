#Rachel Yuan Nong Mikkelsen 2021-02-16 Uppsala Sweden
#2021-03-29 copied and modified to work in this file
#reference datasets are drawn from those chosen by Human_Protein_Atlas/Cell_atlas, 1000 cells each...
#2021-04-16 copied and modified to work for genes that doesn't show expression in all plots.

print("...to view gene:")
gene1_to_views <- readline()

#human_cell_tsne_file <- read.csv("RN2021MAR29_scRNAseq-human-cells_refHPAlist_.csv", sep = ";", header = FALSE)
#human_cell_tsne_file <- human_cell_tsne_file[2:dim(human_cell_tsne_file)[1],]
#human_cell_tsne_file[,2] <- paste0("/Users/rachelnong/Downloads/today_temp/RN2021MAR26-scRNAseq-ref-HPA_", "/", human_cell_tsne_file[,1], "/", human_cell_tsne_file[,2])
#human_cell_tsne_file[,3] <- paste0("/Users/rachelnong/Downloads/today_temp/RN2021MAR26-scRNAseq-ref-HPA_", "/", human_cell_tsne_file[,1], "/", human_cell_tsne_file[,3])

ref_human <- read.csv("/Users/rachelnong/Downloads/today_temp/ENSEMBL_release98_gtf_homo_sapiens/Homo_sapiens.GRCh38.98.gtf.csv", header = FALSE)
gene1_to_views[2] <- as.character(ref_human[which(ref_human[,3] == gene1_to_views),2])

human_cell_tsne_files_0 <- as.data.frame(human_cell_tsne_file)
print("...to skip plots nr:")
to_skip_plots_nr <- readline()
to_skip_plots_nr <- as.numeric(to_skip_plots_nr)
human_cell_tsne_file <- matrix(0, ncol = 3, nrow = 8)
human_cell_tsne_file <- as.data.frame(human_cell_tsne_file)

plot_end1 <- to_skip_plots_nr - 1
plot_end2 <- to_skip_plots_nr + 1
human_cell_tsne_file[1:plot_end1,] <- human_cell_tsne_files_0[1:plot_end1,]
human_cell_tsne_file[to_skip_plots_nr:8,] <- human_cell_tsne_files_0[plot_end2:9,]

	dev.new()
	w <- 3
	l <- round(dim(human_cell_tsne_file)[1]/3)
        a <- w * l
        if( a < dim(human_cell_tsne_file)[1]) { l = l + 1}
        if( a >= dim(human_cell_tsne_file)[1]) { l = l }
	
	par(mfrow = c(l,w), cex = 0.4)
	
	for(k in 1:dim(human_cell_tsne_file)[1]){
		gene1_to_views1 <- c("__")
		matrix_in <- human_cell_tsne_file[k,2]
		matrix_in <- read.csv(matrix_in, header = TRUE)
		rownames(matrix_in) <- matrix_in[,1]
		matrix_in <- matrix_in[,2:dim(matrix_in)[2]]
		
		my_tsne_axies <- human_cell_tsne_file[k,3]
		my_tsne_axies <- as.character(my_tsne_axies)
		my_tsne_axies <- read.csv(my_tsne_axies)
		
		if(nchar(rownames(matrix_in)[1]) != 15[1]){gene1_to_views1 <- gene1_to_views[1]}
		if(nchar(rownames(matrix_in)[1]) == 15[1]){gene1_to_views1 <- gene1_to_views[2]}
		expression_code <- matrix_in[match(gene1_to_views1, rownames(matrix_in), nomatch = 0),]
		expression_code <- as.data.frame(t(expression_code))
		expression_code[expression_code[,1] > 0, 2] <- c("blue")
		expression_code[expression_code[,1] == 0, 2] <- c("lightgrey")
		
		plot_name <- paste0("human cells-", human_cell_tsne_file[k,1], "_1k | ", gene1_to_views)
		plot(my_tsne_axies[,3], my_tsne_axies[,2], pch = 19, col = expression_code[,2], main = plot_name)
	}	
	title(sub = c("blue: 1, lightgrey: 0 "))
	
		
		

