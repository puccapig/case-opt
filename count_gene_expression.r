#Rachel Yuan Nong Mikkelsen 2021-JUL-31


print("min expression: ")
min_expression <- readline()
min_expression <- as.numeric(min_expression)

print("gene name: ")
gene_name <- readline()
gene_name <- as.character(gene_name)

count_gene_expression <- matrix(0, nrow = 1, ncol = 1)
colnames(count_gene_expression) <- c("FALSE")
count_gene_expression <- as.data.frame(count_gene_expression)
	
	for(i in 1:(min_expression + 1)){
		a <- i - 1
		x <- table(mat[gene_name,] > a)
		x <- as.data.frame(t(as.data.frame(x)))
		count_gene_expression[i,1] <- as.numeric(as.character(x[2,1]))
	}

