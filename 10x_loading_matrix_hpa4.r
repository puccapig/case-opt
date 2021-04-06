#Rachel Yuan Nong 2019-06-29
#10x Genomics | Biology at True Resolution
#Rachel Yuan Nong Mikkelsen 2021-March-29 
#copied and modified to work in this file
#copied and modified to work in this file, 2021-March-31

# The R package Matrix supports loading MEX format data, and can be easily used to load the sparse feature-barcode matrix, as shown in the example code below. - 10x Genomics Software page

library(Matrix)

#matrix_dir = "filtered_feature_bc_matrix/"
matrix_dir = readline()

barcode.path <- paste0(matrix_dir, "barcodes.tsv.gz")
features.path <- paste0(matrix_dir, "genes.tsv.gz")
matrix.path <- paste0(matrix_dir, "matrix.mtx.gz")
mat <- readMM(file = matrix.path)

feature.names = read.delim(features.path, header = FALSE, stringsAsFactors = FALSE)
barcode.names = read.delim(barcode.path, header = FALSE, stringsAsFactors = FALSE)

colnames(mat) = barcode.names$V1
rownames(mat) = feature.names$V1

dim(mat)

