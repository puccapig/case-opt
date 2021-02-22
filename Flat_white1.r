#My IBM Cloud
#Rachel Yuan Nong Mikkelsen 2020-FED-22 Uppsala Sweden | Carolina Rediviva
#take a look at D1 dataset by day

data_D1 <- read.delim("BioRxiv-2014-SCRB-seq_GSE53638_D1/GSE53638_D1_UMI.dat.gz")
rownames(data_D1) <- data_D1[,1]
data_D1 <- data_D1[,2:dim(data_D1)[2]]
flasks_D1 <- read.csv("BioRxiv-2014-SCRB-seq_GSE53638_D1/RN2020OCT14-BioRxiv-2014-SCRB-seq_re_D1_.csv")
table(flasks_D1[,6])

cpm_data <- norm.log.mat(data_D1[,flasks_D1[,6] == "day_0"])
pc_cpm_data <- prcomp(cpm_data)
pc_cpm_data_a <- pc_cpm_data[[2]]
my_tsne <- tsne(pc_cpm_data_a[,1:10], k = 2)
par(cex = 0.5)
plot(my_tsne[,2], my_tsne[,1], pch = 19, col = "brown", main = "GSE53638_D1 | day_0")
