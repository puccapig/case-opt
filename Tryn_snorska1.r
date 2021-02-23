#My-IBM-Cloud
#Rachel Yuan Nong Mikkelsen 
#2021-February-23, Akademibokhandeln SUPER REA day! Uppsala SE
#look at 8x100 D1 cells by day
data_D1_pulled <- matrix(0, nrow = dim(data_D1)[1], ncol = 1)
rownames(data_D1_pulled) <- rownames(data_D1)

key_day <- names(table(flasks_D1[,6]))
for(i in 1:length(key_day)){
  a <- key_day[i]
  a <- data_D1[,flasks_D1[,6] == a]
  source("Tryn_snorska_tomato1.r")
  a <- a[,o]
  colnames(a) <- paste0(key_day[i], "-", colnames(a))
  data_D1_pulled <- cbind(data_D1_pulled, a)
}
  data_D1_pulled <- data_D1_pulled[,2:dim(data_D1_pulled)[2]]
  dim(data_D1_pulled)
  table(sapply(strsplit(colnames(data_D1_pulled), "-"), function(x){x[1]}))
  
