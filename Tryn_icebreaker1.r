#Rachel Yuan Nong Mikkelsen 2021-May-01 Uppsala Sweden
#Science Translational Medicine/SynNotch
#ALPG and IL13RA2
#IBM Cloud / IBM Watson Studio 

par(mfrow = c(2,2), cex = 0.5)
barplot(as.matrix(matrix_in['ENSG00000147246',]), col = rainbow(10), main = 'HTR2C | ENSG00000147246')
barplot(as.matrix(matrix_in['ENSG00000123496',]), col = rainbow(10), main = 'IL13RA2 | ENSG00000123496')
barplot(as.matrix(matrix_in['ENSG00000130224',]), col = rainbow(10), main = 'LRCH2 | ENSG00000130224')
barplot(as.matrix(matrix_in['ENSG00000175718',]), col = rainbow(10), main = 'RBMXL3 | ENSG00000175718')

par(mfrow = c(2,2), cex = 0.5)
boxplot(split(t(data_D1['HTR2C',]), as.factor(flasks_D1[,6])), main = 'HTR2C | SCRB-seq 2014 D1')
boxplot(split(t(data_D1['IL13RA2',]), as.factor(flasks_D1[,6])), main = 'IL13RA2 | SCRB-seq 2014 D1')
boxplot(split(t(data_D1['LRCH2',]), as.factor(flasks_D1[,6])), main = 'LRCH2 | SCRB-seq 2014 D1')
boxplot(split(t(data_D1['RBMXL3',]), as.factor(flasks_D1[,6])), main = 'RBMXL3 | SCRB-seq 2014 D1')

a <- c('HTR2C', 'IL13RA2', 'LRCH2', 'RBMXL3')
for(k in 1:length(a)){
  b <- a[k]
  b <- cpm_data[b,]
  b1 <- b
  for(i in 1:951){
    if(b[i] > 0) { b1[i] <- c('blue')}
    if(b[i] <= 0) { b1[i] <- c('grey')}
  }
  table(b1)
  plot_name <- paste0('day1 expression: ', a[k])
  plot(my_tsne[,2], my_tsne[,1], pch = 19, col = b1, main = plot_name)
  if(k == length(a)){
    title(sub = 'bule_1 grey_0')}
}
