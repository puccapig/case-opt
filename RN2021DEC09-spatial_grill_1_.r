#Rachel Yuan Nong Mikkelsen 2021-December-09

tissue_position <- read.csv("tissue_positions_list.csv", header = FALSE) #example plot from 10x_visium_V1_Adult_Mouse_Brain

plot(tissue_position[,3], -tissue_position[,4])

tissue_position_ii <- matrix(0, ncol = 6, nrow = 1)
tissue_position_ii <- as.data.frame(tissue_position_ii)

for(k in 1:21){
	kk <- (k - 1)*6
	for(i in 1:19){
		ki <- (i-1)*2 + 1
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 1,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 1
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 2,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 2
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 2,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 1
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 4,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 2
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 4,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 1
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 5,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "red", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
	for(i in 1:19){
		ki <- (i-1)*2 + 1
		tissue_position_i <- tissue_position[tissue_position[,4] == kk + 3,]
		points(tissue_position_i[ki, 3], -tissue_position_i[ki,4], col = "blue", pch = 19)
		tissue_position_ii <- rbind(tissue_position_ii, tissue_position_i[ki,])
	}
}

tissue_position_ii <- tissue_position_ii[2:dim(tissue_position_ii)[1],]

		for(kk in 1:21){
			kki <- (kk-1)*19*7
		for(k in 1:7){
			ki <- (k-1)*19 + kki
		for(i in 1:19){
			tissue_position_ii[ki + i, 7] <- i
			tissue_position_ii[ki + i, 8] <- kk
			tissue_position_ii[ki + i, 9] <- k
		}
	}
}

