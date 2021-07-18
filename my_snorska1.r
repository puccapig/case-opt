#My-IBM-Cloud My_snorska1.r
#Rachel Yuan Nong Mikkelsen 
#2021-February-24, Akademibokhandeln SUPER REA day! Uppsala SE

key_day <- c("day_0", "day_7")

data_D1_pulled <- matrix(0, nrow = dim(data_D1)[1], ncol = 1)
rownames(data_D1_pulled) <- rownames(data_D1)

for(i in 1:length(key_day)){
   a <- key_day[i]
   a <- data_D1[,flasks_D1[,6] == a]
   colnames(a) <- paste0(key_day[i], "-", colnames(a))
   data_D1_pulled <- cbind(data_D1_pulled, a)
 }
   data_D1_pulled <- data_D1_pulled[,2:dim(data_D1_pulled)[2]]
   dim(data_D1_pulled)
   table(sapply(strsplit(colnames(data_D1_pulled), "-"), function(x){x[1]}))
   
cpm_data_D1_pulled <- norm.log.mat(data_D1_pulled)
pc_cpm_data_D1_pulled <- prcomp(cpm_data_D1_pulled)
pc_cpm_data_D1_pulled_a <- pc_cpm_data_D1_pulled[[2]]

library(plot3D)
experiments.by.day <- sapply(strsplit(colnames(cpm_data_D1_pulled), "[.]"), function(x){x[1]})
cols.by.day <- rainbow(length(table(as.factor(experiments.by.day))))[as.integer(as.factor(experiments.by.day))]
par(mfrow = c(1,1), cex = 0.1)
text3D(pc_cpm_data_D1_pulled_a[,3], pc_cpm_data_D1_pulled_a[,1], pc_cpm_data_D1_pulled_a[,2], labels = experiments.by.day, col = cols.by.day, phi = 29, theta = 20)
