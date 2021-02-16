#Rachel Yuan Nong Mikkelsen 2021-february-16 the 5th! SE
#~home/

tabula_muris_facs_tsne_file <- read.delim("tsne_facs-tabula-muris_.txt")
tabula_muris_facs_data_file <- list.files("~BioRxiv-2017-Tabula-Muris-data_sets_droplet/5715040/FACS")

tabula_muris_facs_tsne_file[1,2] <- tabula_muris_facs_data_file[grep("Trachea", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[2,2] <- tabula_muris_facs_data_file[grep("Tongue", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[3,2] <- tabula_muris_facs_data_file[grep("Skin", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[4,2] <- tabula_muris_facs_data_file[grep("Muscle", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[5,2] <- tabula_muris_facs_data_file[grep("Marrow", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[6,2] <- tabula_muris_facs_data_file[grep("Mammary", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[7,2] <- tabula_muris_facs_data_file[grep("Spleen", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[8,2] <- tabula_muris_facs_data_file[grep("Fat", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[9,2] <- tabula_muris_facs_data_file[grep("Pancreas", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[10,2] <- tabula_muris_facs_data_file[grep("Liver", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[11,2] <- tabula_muris_facs_data_file[grep("Thymus", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[12,2] <- tabula_muris_facs_data_file[grep("Kidney", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[13,2] <- tabula_muris_facs_data_file[grep("Heart", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[14,2] <- tabula_muris_facs_data_file[grep("Colon", tabula_muris_facs_data_file)]
tabula_muris_facs_tsne_file[15,2] <- tabula_muris_facs_data_file[grep("Bladder", tabula_muris_facs_data_file)]

tabula_muris_facs_tsne_file[,3] <- sapply(strsplit(tabula_muris_facs_tsne_file[,2], "-"), function(x){x[1]})

tabula_muris_facs_tsne_file[1:15,2] <- paste0(~, tabula_muris_facs_tsne_file[1:15,2])


