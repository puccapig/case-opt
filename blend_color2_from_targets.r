#Rachel Yuan Nong Mikkelsen 2023OCT11
#from /StanfordU/function.R
#for example plot for two genes or genesets expression with visium or scRNAseq data 

ref_mouse <- read.delim("/Users/rachelnong/Downloads/today_temp/GSE124691-CD44pos-PD---/GSE124691_Genes.tsv")
library(RColorBrewer)
my.pal <- brewer.pal(9, "Set1")

if(dim(genes_)[2] > 1){
	targets <- my.pal[1:dim(genes_)[2]]
	values <- matrix(0, nrow = dim(genes_)[2], ncol = dim(mat)[2])
	for(i in 1:dim(genes_)[2]){
		expr_ <- cpm_mat[match(genes_[,i], rownames(cpm_mat), nomatch = 0),]
		expr_sum_ <- rowSums(expr_)
		expr_ <- expr_/(expr_sum_ + 1)
		expr_ <- colSums(expr_)/dim(expr_)[1]
		values[i,] <- expr_
		}
	}
if(dim(genes_)[2] == 1){	
		targets <- my.pal[1:dim(genes_)[2]]
		values <- cpm_mat[match(genes_, rownames(cpm_mat), nomatch = 0),]
	}

col.from.target <- function(){
v <- t(apply(values, 1, function(x) {(x-min(x))/(max(x)-min(x))}))
    fractions <- apply(v, 2, function(x) {x/sum(x)})
    fractions[is.nan(fractions)] <- 1.0/(dim(fractions)[1])
    targets.rgb <- col2rgb(targets)
    res <- vector("character", length=length(targets))
    for(i in 1:(dim(values)[2])) {
      mytarget.rgb <- 255-t(apply(targets.rgb, 1, function(x) {(255-x) * v[,i]}))
      mytarget.rgb <- rowSums(t(apply(mytarget.rgb, 1, function(x) {x * fractions[,i]})))
      #        cat(fractions)
      #        cat(i)
      res[i] <- rgb(red=mytarget.rgb['red']/256, green=mytarget.rgb['green']/256, blue=mytarget.rgb['blue']/256)
    }
    return(res)
}

blend_cols_ <- col.from.target()
print("|col.from.target()")

