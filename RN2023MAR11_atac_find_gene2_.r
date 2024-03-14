#Rachel Yuan Nong Mikkelsen 2023MAR11

#from tumordotr package
library(RColorBrewer)
my.pal <- brewer.pal(9, "Set1")

target <- my.pal[1:length(look_at_gene)]
values <- matrix_in[match(look_at_gene, rownames(matrix_in), nomatch = 0),]

col.from.target <-
function(targets, values) {
      v <- (values-min(values))/(max(values)-min(values))
    targets.rgb <- col2rgb(targets)
    res <- vector("character", length=length(targets))
    for(i in 1:length(values)) {
      mytarget.rgb <- 255-t(unlist(apply(targets.rgb, 1, function(values) {(255-values) * v[i]})))
      res[i] <- rgb(red=mytarget.rgb[1]/256, green=mytarget.rgb[2]/256, blue=mytarget.rgb[3]/256)
    }
    return(res)
  }

matrix_in <- mtx
matrix_in <- matrix_in[match(express_mat0_, rownames(matrix_in), nomatch = 0),]
matrix_in <- matrix_in[rowSums(matrix_in) != 0,]
express_mat0_ <- express_mat0_[rowSums(matrix_in) != 0]
express_gene0_ <- express_gene0_[rowSums(matrix_in) != 0]

my_tsne_ <- read.csv("my_tsne.csv")
print(length(express_mat0_)-1)
print("set ncol = ")
n_col <- readline()
n_col <- as.numeric(n_col)
print("set nrow = ")
n_row <- readline()
n_row <- as.numeric(n_row)

par(mfrow = c(n_row, n_col), cex = 0.4)

for(i in 1:(length(express_mat0_)-1)){
	key1_ <- i + 1
	look_at_gene <- as.character(express_mat0_[key1_])
	target <- my.pal[1:length(look_at_gene)]
	values <- matrix_in[match(look_at_gene, rownames(matrix_in), nomatch = 0),]
	cols.by.raw.counts <- col.from.target(target, values)
	plot(my_tsne_[,3], my_tsne_[,2], pch = 19, col = cols.by.raw.counts, main = look_at_gene)
	title(sub = express_gene0_[key1_])
}

