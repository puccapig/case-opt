#Rachel Yuan Nong Mikkelsen 2021-May-01, Uppsala Sweden
#
print('require a: gene_name, gene_ensembl_')
print(a)

a1 <- a[,1] #gene_name
a <- a[,2] #gene_ensembl_

#plot expression in a human cell reprogramming experiments
print('>>plot expression in a human cell reprogramming experiments')
par(mfrow = c(2,2), cex = 0.5)
for(k in 1:length(a)){
  gene1 <- a1[k]
  gene1_en <- a[k]
  plot_name <- paste0(gene1, ' | ', gene1_en)
  barplot(as.matrix(matrix_in[gene1_en,]), col = rainbow(10), main = plot_name)
}
  
#plot expression in a directed differentiation of fat cells experiment
print('>>plot expression in a directed differentiation of fat cells experiment')
par(mfrow = c(2,2), cex = 0.5)
for(k in 1:length(a)){
  gene1 <- a1[k]
  gene1_en <- a[k]
  plot_name <- paste0(gene1, ' | SCRB-seq 2014 D1')
  boxplot(split(t(data_D1['HTR2C',]), as.factor(flasks_D1[,6])), main = plot_name)
}

#plot single cell expression 1/0 | dataset: SCRB-seq
print('>>expression range on day1/SCRB-seq')
for(k in 1:length(a)){
  b <- a1[k]
  print(paste0('range ', b))
  print(range(cpm_data[b,]))
}

print('>>plot single cell expression 1/0 | dataset: SCRB-seq day1')
for(k in 1:length(a)){
  b <- a1[k]
  b <- cpm_data[b,]
  b1 <- b
  for(i in 1:951){
    if(b[i] > 0) { b1[i] <- c('blue')}
    if(b[i] <= 0) { b1[i] <- c('grey')}
  }
  table(b1)
  plot_name <- paste0('day1 expression: ', a1[k])
  plot(my_tsne[,2], my_tsne[,1], pch = 19, col = b1, main = plot_name)
  if(k == length(a)){
    title(sub = 'bule_1 grey_0')}
}
