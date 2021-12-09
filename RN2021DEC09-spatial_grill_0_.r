#Rachel Yuan Nong Mikkelsen 2021-DEC-09

tissue_position_ii[,10] <- paste0("r.", tissue_position_ii[,8], ".c.", tissue_position_ii[,7], "-1")

cols_tissue_position_ii <- c(1:dim(tissue_position_ii)[1])

for(i in 1:length(cols_tissue_position_ii)){
	cols_tissue_position_ii[i] <- cols.by.grill[match(tissue_position_ii[i,10], colnames(matrix_out), nomatch = 0)]
}

print("cols_tissue_position_ii")
