#Rachel Yuan Nong Mikkelsen 2021-SEPT-27
#require sum 1/0 per gene per tissue sample / 10x visium st#b1

print("STEP WISE: ")
step_wise <- readline()
step_wise <- as.numeric(step_wise)
step_wise_i = round(4991/step_wise)
step_wise_table <- matrix(0, ncol = 2, nrow = 1)
step_wise_table <- as.data.frame(step_wise_table)

for(i in 1:step_wise_i){
	k = (i-1)*step_wise + 1
	table_b1 <- as.data.frame(table(b1[,1] > k))
	step_wise_table[i, 2] <- as.numeric(as.character(table_b1[2,2]))
	step_wise_table[i, 1] <- k
	}

par(cex = 0.5)
plot(step_wise_table[,1], step_wise_table[,2], pch = 19, col = "red")

