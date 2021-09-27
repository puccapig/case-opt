#Rachel Yuan Nong Mikkelsen 2021-SEPT-26
#requires 10x tissue_position[,3:4]

#y-direction: 1 - 76
#x-direction: 3 - 124
#plot(tissue_position[,4], -tissue_position[,3], col = "red", cex = 0.5)

surrounding_spots <- matrix(1, ncol = 2, nrow = 6)
tissue_expression_score <- matrix(0, ncol = 4, nrow = 1)
tissue_expression_score <- as.data.frame(tissue_expression_score)
tissue_expression_score1 <- matrix(0, ncol = 4, nrow = 1)
tissue_expression_score0 <- matrix(0, ncol = 1, nrow = dim(matrix_out)[1])

i = 0
k = 0
gene_i = 0
for(gene_i in 1:dim(tissue_expression_score0)[1]){
#for(gene_i in 1:10){
	tissue_expression_score <- matrix(0, ncol = 4, nrow = 1)
	tissue_expression_score <- as.data.frame(tissue_expression_score)
	tissue_expression_score1 <- matrix(0, ncol = 4, nrow = 1)
for(i in 1:38){
        i = (i-1)*2 + 1
        for(k in 1:61){
        k = (k-1)*2 + 3
	a_ki <- which(tissue_position[,3] == i & tissue_position[,4] == k)
	a_ki <- matrix_out[gene_i, a_ki]
	surrounding_spots[1:2, 1] <- i
	surrounding_spots[1,2] <- k - 2
	surrounding_spots[2,2] <- k + 2
	surrounding_spots[3:4, 1] <- i - 1
	surrounding_spots[3, 2] <- k - 1
	surrounding_spots[4, 2] <- k + 1
	surrounding_spots[5:6, 1] <- i + 1
	surrounding_spots[5, 2] <- k - 1
	surrounding_spots[6, 2] <- k + 1
	
	surrounding_i = 0
	surrounding_score = 0
	for(surrounding_i in 1:6){
	a_ki_a <- surrounding_spots[surrounding_i,2]
	a_ki_b <- surrounding_spots[surrounding_i,1]
	a_ki_ab <- which(tissue_position[,4] == a_ki_a & tissue_position[,3] == a_ki_b)
	if(matrix_out[gene_i, a_ki_ab] > 0){surrounding_score = surrounding_score + 1}
	if(matrix_out[gene_i, a_ki_ab] <= 0){surrounding_score = surrounding_score - 1}
	}
	if(a_ki > 0){surrounding_score = surrounding_score + 1}
	if(a_ki <= 0){surrounding_score = surrounding_score - 1}
	
	tissue_expression_score1[1,1] <- gene_i
	tissue_expression_score1[1,2] <- i
	tissue_expression_score1[1,3] <- k
	tissue_expression_score1[1,4] <- surrounding_score
	tissue_expression_score <- rbind(tissue_expression_score, tissue_expression_score1)
	tissue_expression_score0[gene_i,1] <- sum(tissue_expression_score[,4])
}
}
}
