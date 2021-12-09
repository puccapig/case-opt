#Rachel Yuan Nong Mikkelsen 2021-December-09

matrix_out <- matrix(0, ncol = dim(tissue_position_ii)[1]/7, nrow = dim(matrix_in)[1])
rownames(matrix_out) <- rownames(matrix_in)
matrix_out <- as.data.frame(matrix_out)
i <- 0
	for(kc in 1:19){
                for(kr in 1:21){
                        tissue_feature_i <- tissue_position_ii[tissue_position_ii[,8] == kr & tissue_position_ii[,7] == kc,]
                        feature_expression_i <- matrix_in[, match(as.character(tissue_feature_i[,1]), colnames(matrix_in), nomatch = 0)]
                        feature_expression_i <- 2^feature_expression_i - 1
                        feature_expression_i <- rowSums(feature_expression_i)/7
                        feature_expression_i <- log10(feature_expression_i + 1)
                        i <- i + 1
			matrix_out[,i] <- feature_expression_i
			colnames(matrix_out)[i] <- paste0("r.", kr, ".c.", kc, "-1")
	print(i)
	}
}


