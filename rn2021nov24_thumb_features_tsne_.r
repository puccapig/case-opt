#Rachel Yuan Nong Mikkelsen 2021-NOVEMBER-24
#single out two features (comprise of fewer cells) and see their expressions 1/0..
#require my_tsne.csv matrix_in

print("thumb_features | screen_feature [1][2] , my_tsne_co")
thumb_features <- function(screen_feature, my_tsne_co){

print("to screen feature n = [1] [2]")
screen_feature <- readline()
screen_feature <- as.numeric(screen_feature)
my_tsne_axis <- read.csv(my_tsne_co)
my_tsne_axis <- my_tsne_axis[,2:3]

if(screen_feature == 1){
	print("place R locator at 4 positions for one feature:")
	print("use R locator 4x:")
	feature_1 <- locator(n = 4)
	feature_1_axis <- feature_1[[1]]
	feature_1_axis <- as.data.frame(feature_1_axis)
	feature_1_axis[,2] <- feature_1[[2]]
	colnames(feature_1_axis) <- c("x_axis", "y_axis")
	max_x_axis <- max(feature_1_axis[,1])
	min_x_axis <- min(feature_1_axis[,1])
	max_y_axis <- max(feature_1_axis[,2])
	min_y_axis <- min(feature_1_axis[,2])
	
	points(my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 2], my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 1], pch = 19, col = "grey")

	matrix_out <- 2^matrix_in - 1
	matrix_out_feature_1 <- matrix_out[ ,my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis]
	summary_matrix_out_feature_1 <- rowSums(matrix_out_feature_1)/dim(matrix_out_feature_1)[2]
	summary_matrix_out_feature_1 <- as.data.frame(summary_matrix_out_feature_1)
	for(i in 1:dim(matrix_in)[1]){
		summary_matrix_out_feature_1[i,2] <- max(matrix_out_feature_1[i,])
	}
	colnames(summary_matrix_out_feature_1) <- c("ave_expression", "max_expression")
	rownames(summary_matrix_out_feature_1) <- rownames(matrix_out)

	matrix_out_feature_0 <- matrix_out[ ,my_tsne_axis[,2] < min_x_axis | my_tsne_axis[,2] > max_x_axis | my_tsne_axis[,1] < min_y_axis | my_tsne_axis[,1] > max_y_axis]
	
	summary_matrix_out_feature_0 <- rowSums(matrix_out_feature_0)/dim(matrix_out_feature_0)[2]
	summary_matrix_out_feature_0 <- as.data.frame(summary_matrix_out_feature_0)
	for(i in 1:dim(matrix_in)[1]){
		summary_matrix_out_feature_0[i,2] <- max(matrix_out_feature_0[i,])
	}
	colnames(summary_matrix_out_feature_0) <- c("ave_expression", "max_expression")
	rownames(summary_matrix_out_feature_0) <- rownames(matrix_out)

	summary_matrix_out_feature_1_vs_0 <- matrix(0, ncol = 2, nrow = dim(matrix_in)[1])
	summary_matrix_out_feature_1_vs_0[,1] <- summary_matrix_out_feature_1[,1]/summary_matrix_out_feature_0[,1]
	summary_matrix_out_feature_1_vs_0[,2] <- summary_matrix_out_feature_1[,2]/summary_matrix_out_feature_0[,2]
	colnames(summary_matrix_out_feature_1_vs_0) <- c("ave_1_vs_0", "max_1_vs_0")
	rownames(summary_matrix_out_feature_1_vs_0) <- rownames(matrix_out)

	top_expression_ave_feature_1v0 <- summary_matrix_out_feature_1_vs_0[order(summary_matrix_out_feature_1_vs_0[,1], decreasing = TRUE), ]
	top_expression_ave_feature_1v0 <- top_expression_ave_feature_1v0[1:10,]
	
	top_expression_ave_feature_1v0_by_weight <- cbind(summary_matrix_out_feature_1, summary_matrix_out_feature_1_vs_0)
	top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[top_expression_ave_feature_1v0_by_weight[,3] == "Inf",]
	top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[order(top_expression_ave_feature_1v0_by_weight[,1], decreasing = TRUE),]
	top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[1:10,]

}

if(screen_feature == 2){
        print("place R locator at 4 positions for one feature:")
        print("use R locator 4x:")
        feature_1 <- locator(n = 4)
        feature_1_axis <- feature_1[[1]]
        feature_1_axis <- as.data.frame(feature_1_axis)
        feature_1_axis[,2] <- feature_1[[2]]
        colnames(feature_1_axis) <- c("x_axis", "y_axis")
        max_x_axis <- max(feature_1_axis[,1])
        min_x_axis <- min(feature_1_axis[,1])
        max_y_axis <- max(feature_1_axis[,2])
        min_y_axis <- min(feature_1_axis[,2])

        points(my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 2], my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 1], pch = 19, col = "grey")

        matrix_out <- 2^matrix_in - 1
        matrix_out_feature_1 <- matrix_out[ ,my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis]
        summary_matrix_out_feature_1 <- rowSums(matrix_out_feature_1)/dim(matrix_out_feature_1)[2]
        summary_matrix_out_feature_1 <- as.data.frame(summary_matrix_out_feature_1)
        for(i in 1:dim(matrix_in)[1]){
                summary_matrix_out_feature_1[i,2] <- max(matrix_out_feature_1[i,])
        }
        colnames(summary_matrix_out_feature_1) <- c("ave_expression", "max_expression")
        rownames(summary_matrix_out_feature_1) <- rownames(matrix_out)

	print("place R locator at 4 positions for one feature:")
        print("use R locator 4x:")
        feature_1 <- locator(n = 4)
        feature_1_axis <- feature_1[[1]]
        feature_1_axis <- as.data.frame(feature_1_axis)
        feature_1_axis[,2] <- feature_1[[2]]
        colnames(feature_1_axis) <- c("x_axis", "y_axis")
        max_x_axis <- max(feature_1_axis[,1])
        min_x_axis <- min(feature_1_axis[,1])
        max_y_axis <- max(feature_1_axis[,2])
        min_y_axis <- min(feature_1_axis[,2])

        points(my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 2], my_tsne_axis[my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis, 1], pch = 19, col = "black")
        matrix_out_feature_0 <- matrix_out[ ,my_tsne_axis[,2] > min_x_axis & my_tsne_axis[,2] < max_x_axis & my_tsne_axis[,1] > min_y_axis & my_tsne_axis[,1] < max_y_axis]

	summary_matrix_out_feature_0 <- rowSums(matrix_out_feature_0)/dim(matrix_out_feature_0)[2]
        summary_matrix_out_feature_0 <- as.data.frame(summary_matrix_out_feature_0)
        for(i in 1:dim(matrix_in)[1]){
                summary_matrix_out_feature_0[i,2] <- max(matrix_out_feature_0[i,])
        }
        colnames(summary_matrix_out_feature_0) <- c("ave_expression", "max_expression")
        rownames(summary_matrix_out_feature_0) <- rownames(matrix_out)

        summary_matrix_out_feature_1_vs_0 <- matrix(0, ncol = 2, nrow = dim(matrix_in)[1])
        summary_matrix_out_feature_1_vs_0[,1] <- summary_matrix_out_feature_1[,1]/summary_matrix_out_feature_0[,1]
        summary_matrix_out_feature_1_vs_0[,2] <- summary_matrix_out_feature_1[,2]/summary_matrix_out_feature_0[,2]
        colnames(summary_matrix_out_feature_1_vs_0) <- c("ave_1_vs_0", "max_1_vs_0")
        rownames(summary_matrix_out_feature_1_vs_0) <- rownames(matrix_out)

        top_expression_ave_feature_1v0 <- summary_matrix_out_feature_1_vs_0[order(summary_matrix_out_feature_1_vs_0[,1], decreasing = TRUE), ]
        top_expression_ave_feature_1v0 <- top_expression_ave_feature_1v0[1:10,]

        top_expression_ave_feature_1v0_by_weight <- cbind(summary_matrix_out_feature_1, summary_matrix_out_feature_1_vs_0)
        top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[top_expression_ave_feature_1v0_by_weight[,3] == "Inf",]
        top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[order(top_expression_ave_feature_1v0_by_weight[,1], decreasing = TRUE),]
        top_expression_ave_feature_1v0_by_weight <- top_expression_ave_feature_1v0_by_weight[1:10,]
}
	print("matrix_out_feature_1:dim")
	print(dim(matrix_out_feature_1))
	print("matrix_out_feature_0:dim")
	print(dim(matrix_out_feature_0))
	print("summary_matrix_out_feature_1_vs_0: Inf")
	print(table(summary_matrix_out_feature_1_vs_0[,1] == "Inf"))
	write.csv(top_expression_ave_feature_1v0_by_weight, file = "top_expression_ave_feature_1v0_by_weight.csv")
	print("top_expression_ave_feature_1v0_by_weight")
	print(top_expression_ave_feature_1v0_by_weight)
	print("top_expression_ave_feature_1v0_by_weight.csv")

}
