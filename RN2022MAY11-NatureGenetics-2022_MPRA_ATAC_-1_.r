#Rachel Yuan Nong Mikkelsen 2022MAY11


print("rs within gene:")
rs_within_gene_ <- readline()
print("of chromosome")
of_chromosome_ <- readline()
print(":left at")
left_at_ <- readline()
print(":right at")
right_at_ <- readline()
print("extend to 1M: [1][0]")
extend_to_1m_ <- readline()

left_at_ <- as.numeric(left_at_)
right_at_ <- as.numeric(right_at_)

ng_mpra1 <- ng_mpra[which(ng_mpra[,27] == of_chromosome_),]
ng_mpra1 <- ng_mpra1[order(ng_mpra1[,28]),]

ng_mpra_rs_within_gene_ <- ng_mpra1[which(ng_mpra1[,28] >= left_at_ & ng_mpra1[,28] < right_at_),]

par(mfrow = c(2,1), cex = 0.5)
plot(ng_mpra_rs_within_gene_[,28], ng_mpra_rs_within_gene_[,10], ylab = "A.Exp.Mean")
plot(ng_mpra_rs_within_gene_[,28], ng_mpra_rs_within_gene_[,9], ylab = "A.Ctrl.Mean")
title(sub = paste0(rs_within_gene_, " |", of_chromosome_, " |:", (left_at_ - right_at_)/1000, "kb"))

if(extend_to_1m_ == 1){
	dev.new()
	par(mfrow = c(3,1), cex = 0.5)
	extend_center_ <- (left_at_ + right_at_)/2
	extend_left_at_ <- extend_center_ - 500000
	extend_right_at_ <- extend_center_ + 500000
	ng_mpra_e1m_ <- ng_mpra1[ng_mpra1[,28] >= extend_left_at_ & ng_mpra1[,28] < extend_right_at_,]
	plot(ng_mpra_e1m_[,28], ng_mpra_e1m_[,10], ylab = "A.Exp.Mean")
	plot(ng_mpra_e1m_[,28], ng_mpra_e1m_[,9], ylab = "A.Ctrl.Mean")
	title(sub = paste0(rs_within_gene_, " |", of_chromosome_, " |:1m out of", (left_at_ - right_at_)/1000, "kb"))
	plot(ng_mpra_e1m_[,28], ng_mpra_e1m_[,10]/ng_mpra_e1m_[,9], ylab = "A.Exp/A.Ctrl.Mean")
	}

















