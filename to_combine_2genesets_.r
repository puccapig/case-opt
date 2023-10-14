#Rachel Yuan Nong Mikkelsen 2023OCT11

a <- read.csv("more_genes1.csv")
b <- read.csv("more_genes2.csv")

no_a <- dim(a)[1]
no_b <- dim(b)[1]

delta_ <- no_a - no_b

a <- as.character(a[,dim(a)[2]])
b <- as.character(b[,dim(b)[2]])

if(delta_ > 0){
	genes0_ <- a
	genes1_ <- b
	name_genes0_ <- c("more_genes1.csv")
	name_genes1_ <- c("more_genes2.csv")
	}
if(delta_ < 0){
	genes0_ <- b
	genes1_ <- a
	name_genes0_ <- c("more_genes2.csv")
        name_genes1_ <- c("more_genes1.csv")
	}
if(delta_ == 0){
	genes0_ <- a
	genes1_ <- b
	name_genes0_ <- c("more_genes1.csv")
        name_genes1_ <- c("more_genes2.csv")
	}

genes1_[(no_b+1):no_a] <- -1
genes_ <- cbind(as.character(genes0_), as.character(genes1_))
colnames(genes_) <- c(name_genes0_, name_genes1_)

print(">>>> genes_")
