rm(list=ls())
setwd("~/Documents/NCSU/RNAseq_Mimulus/HeatMaps/")
getwd()

library ("pheatmap")
library ("NMF")
library("dendextend")
library("d3heatmap")
library("ape")
library("gplots")
library("RColorBrewer") 

# get data
Day00= read.table(file="d00_ALL_RPKM.txt",header=TRUE, sep="\t")
#Day00$d00 <- (Day00$Day00_BR1 + Day00$Day00_BR4 + Day00$Day00_BR5 + Day00$Day00_BR6  + Day00$Day00_BR7)/5
#Day00=Day00[,c(-2:-6)]
Day00 = unique(Day00)

Day02= read.table(file="d02_ALL_RPKM.txt",header=TRUE, sep="\t")
#Day02$d02 <- (Day02$Day02d_BR4 + Day02$Day02d_BR5 + Day02$Day02d_BR6 + Day02$Day02d_BR7)/4
#Day02=Day02[,c(-2:-5)]
Day02 = unique(Day02)

Day04= read.table(file="d04_ALL_RPKM.txt",header=TRUE, sep="\t")
#Day04$d04 <- (Day04$Day04_BR2 +  Day04$Day04_BR3 +  Day04$Day04_BR4)/3
#Day04=Day04[,c(-2:-4)]
Day04 = unique(Day04)

Day06= read.table(file="d06_ALL_RPKM.txt",header=TRUE, sep="\t")
#Day06$d06 <- (Day06$Day06_BR1 +Day06$Day06_BR2 + Day06$Day06_BR3 + Day06$Day06_BR4)/4
#Day06=Day06[,c(-2:-5)]
Day06 = unique(Day06)

Day08= read.table(file="d08_ALL_RPKM.txt",header=TRUE, sep="\t")
#Day08$d08 <- (Day08$Day08_BR1+ Day08$Day08_BR2+Day08$Day08_BR3+Day08$Day08_BR4)/4
#Day08=Day08[,c(-2:-5)]
Day08 = unique(Day08)

#Merge with Miguel T.F data
TF=read.table(file = "Migu_TF_list.txt", header = T)
TF = unique(TF)

###################################################################
#merge all data -- DAY00
###################################################################
# 1) first, merge table using all option 
all = merge(Day00,TF,by="gene_short_name",all=T)
all=unique(all)

# 2) here get the genes in your TF list
all = all[all$TF_ID %in% TF$TF_ID,]

#write.table(x = all, "Miguel_TF_DAY00")


###################################################################
#merge all data -- DAY02
###################################################################
# 1) first, merge table using all option 
all2 = merge(Day02,TF,by="gene_short_name",all=T)
all2=unique(all2)

# 2) here get the genes in your TF list
all2 = all2[all2$TF_ID %in% TF$TF_ID,]


#write.table(x = all2, "Miguel_TF_DAY02")

###################################################################
#merge all data -- DAY04
###################################################################
# 1) first, merge table using all option 
all3 = merge(Day04,TF,by="gene_short_name",all=T)
all3=unique(all3)

# 2) here get the genes in your TF list
all3 = all3[all3$TF_ID %in% TF$TF_ID,]

#write.table(x = all3, "Miguel_TF_DAY04")

###################################################################
#merge all data -- DAY06
###################################################################
# 1) first, merge table using all option 
all4 = merge(Day06,TF,by="gene_short_name",all=T)
all4=unique(all4)

# 2) here get the genes in your TF list
all4 = all4[all4$TF_ID %in% TF$TF_ID,]

#write.table(x = all4, "Miguel_TF_DAY06")

###################################################################
#merge all data -- DAY08
###################################################################
# 1) first, merge table using all option 
all5 = merge(Day08,TF,by="gene_short_name",all=T)
all5=unique(all5)

# 2) here get the genes in your TF list
all5 = all5[all5$TF_ID %in% TF$TF_ID,]

#write.table(x = all5, "Miguel_TF_DAY08")

###################################################################
#merge all datasets
###################################################################
final=merge(all,all2, by="TF_ID")
final2=merge(final,all3, by="TF_ID")
final3=merge(final2,all4, by="TF_ID")

final=unique(final)
