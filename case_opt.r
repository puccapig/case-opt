#Rachel Yuan Nong 2019-DEC-06
#Human genes to Mouse_ Absolutely not recommeneded. 


print("human genes_ to mouse using: genes_more ...")
genesmore <- readline()
genes_more <- read.csv(genesmore, sep = ";")

#that is a file resulted from look_up_genes_names.R

genes_less <- genes_more[,1]

more_genes <- c(1:length(genes_less))

case1 <- c("A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z")

case2 <- c("a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z")

case1 <- as.data.frame(case1)
case2 <- as.data.frame(case2)

for(i in 1:length(genes_less)){
	a <- as.character(genes_less[i])
	b <- strsplit(a, "")
	b <- unlist(b)
	new_b <- b[1]
	ex_new_b <- length(b)-1

		for(m in 1:ex_new_b){
			m_b <- m + 1
			if(match(b[m_b], case1[,1], nomatch = 0) == 0){
				b_added <- b[m_b]}
			if(match(b[m_b], case1[,1], nomatch = 0) != 0){
				b_added <- case2[match(b[m_b], case1[,1], nomatch = 0), 1]}
			new_b <- paste0(new_b, b_added)
			}
	more_genes[i] <- new_b
}

print("Returning in more_genes")
