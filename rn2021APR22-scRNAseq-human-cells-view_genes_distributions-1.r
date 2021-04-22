#Rachel Yuan Nong Mikkelsen 2021-02-16 Uppsala Sweden
#2021-03-29 copied and modified to work in this file
#reference datasets are drawn from those chosen by Human_Protein_Atlas/Cell_atlas, 1000 cells each...
#2021-04-22 used and modified to hist() gene sampled single cells.

print("...to view gene:")
gene1_to_views <- readline()

human_cell_tsne_file <- read.csv("RN2021MAR29_scRNAseq-human-cells_refHPAlist_.csv", sep = ";", header = FALSE)
human_cell_tsne_file <- human_cell_tsne_file[2:dim(human_cell_tsne_file)[1],]
human_cell_tsne_file[,2] <- paste0("~/RN2021MAR26-scRNAseq-ref-HPA_", "/", human_cell_tsne_file[,1], "/", human_cell_tsne_file[,2])
human_cell_tsne_file[,3] <- paste0("~/RN2021MAR26-scRNAseq-ref-HPA_", "/", human_cell_tsne_file[,1], "/", human_cell_tsne_file[,3])

ref_human <- read.csv("~.GRCh38~.csv", header = FALSE)
gene1_to_views[2] <- as.character(ref_human[which(ref_human[,3] == gene1_to_views),2])

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
		matrix_in <- as.data.frame(matrix_in)
                
		if(nchar(rownames(matrix_in)[1]) != 15[1]){gene1_to_views1 <- gene1_to_views[1]}
                if(nchar(rownames(matrix_in)[1]) == 15[1]){gene1_to_views1 <- gene1_to_views[2]}
		
		plot_name <- paste0("human cells-", human_cell_tsne_file[k,1], "_1k | ", gene1_to_views)
		expression_profile <- t(matrix_in[gene1_to_views1,])
                expression_profile1 <- expression_profile != 0
                expression_profile <- expression_profile[expression_profile1 == "TRUE", 1]
                proportion_expression <- round(length(expression_profile)/dim(matrix_in)[2], digits = 6)
                proportion_expression <- paste0("% ", proportion_expression * 100, " in ", dim(matrix_in)[2], " cells")
                hist(expression_profile, main = plot_name, xlab = proportion_expression)
        }
        title(sub = "cpm")


