#Rachel Yuan Nong Mikkelsen 2021-JUL-31


print("max expression: ")
max_expression <- readline()
max_expression <- as.numeric(max_expression)
jumper_add <- round(max_expression/100)
a <- 0

print("gene name: ")
gene_name <- readline()
gene_name <- as.character(gene_name)

count_gene_expression <- matrix(0, nrow = 1, ncol = 1)
colnames(count_gene_expression) <- c("FALSE")
count_gene_expression <- as.data.frame(count_gene_expression)
	
	for(i in 1:102){
		a <- jumper_add*(i - 1)
		x <- table(mat[gene_name,] > a)
		x <- as.data.frame(t(as.data.frame(x)))
		count_gene_expression[i,1] <- as.numeric(as.character(x[2,1]))
	}

