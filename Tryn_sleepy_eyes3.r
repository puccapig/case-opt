#Tryn_sleepy_eyes3.r
#Rachel Yuan Nong Mikkelsen 2021-February-18 Uppsala Sweden
#This R script is written in My IBM project -Sleepy eyes2- environment R 3.6 
#matrix_in is a dataset from Cell-2015-Mikkelsen-Integrative analysis of human reprogramming.... after log2(+1) transformation..
#original dataset (re-saved.csv file) has been downloaded and stored in the previous folder.
#Same dataset (excel file and re-saved.csv file) is stored at Assets.

print("to look at gene (ENSG):")
look_at_gene <- readline()
par(cex = 0.1)
barplot(as.matrix(matrix_in[look_at_gene,]), col = rainbow(10), ylab = "expression log2(FPKM +1)")

