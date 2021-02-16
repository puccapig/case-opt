#Rachel Yuan Nong Mikkelsen 2021-02-16 Uppsala Sweden

print("...to view gene:")
gene1_to_views <- readline()

	dev.new()
	par(mfrow = c(4,4), cex = 0.4)
	
	for(k in 1:15){
		matrix_in <- tabula_muris_facs_tsne_file[k,2]
		matrix_in <- read.csv(matrix_in, header = TRUE)
		rownames(matrix_in) <- matrix_in[,1]
		matrix_in <- matrix_in[,2:dim(matrix_in)[2]]
		
		my_tsne_axies <- tabula_muris_facs_tsne_file[k,1]
		my_tsne_axies <- as.character(my_tsne_axies)
		my_tsne_axies <- read.csv(my_tsne_axies)
		
		expression_code <- matrix_in[match(gene1_to_views, rownames(matrix_in), nomatch = 0),]
		expression_code <- as.data.frame(t(expression_code))
		expression_code[expression_code[,1] > 0, 2] <- c("blue")
		expression_code[expression_code[,1] == 0, 2] <- c("lightgrey")
		
		plot_name <- paste0("tabula muris-", tabula_muris_facs_tsne_file[k,3], " | ", gene1_to_views)
		plot(my_tsne_axies[,3], my_tsne_axies[,2], pch = 19, col = expression_code[,2], main = plot_name)
	}	
	title(sub = c("blue: 1, lightgrey: 0 "))
	
		
		

