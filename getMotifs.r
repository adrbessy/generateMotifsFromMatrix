#!/usr/bin/env Rscript
args = commandArgs(trailingOnly=TRUE)

# Rscript --vanilla sillyScript.R iris.txt out.txt

# test if there is at least one argument: if not, return an error
# if (length(args)==0) {
#   stop("At least one argument must be supplied (input file).n", call.=FALSE)
# } else if (length(args)==1) {
#   # default output file
#   args[2] = "out.txt"
# }
print(paste("args[1] : ",args[1]))
# df = read.table(args[1], header=TRUE)
b = substr(args[1], 1, nchar(args[1])-4) 
# your input (example):

# T	G	C	A
# 0.2927	0.1933	0.2472	0.2668
# 0.0554	0.9208	0.0233	0.0005
# 0.2316	0.7674	0.0005	0.0005
# 0.0005	0.0005	0.9985	0.0005
# 0.9861	0.0036	0.0098	0.0005
# 0.0005	0.9985	0.0005	0.0005
# 0.9208	0.0741	0.0046	0.0005
# 0.8037	0.0461	0.0451	0.1052
# 0.5498	0.0813	0.2585	0.1104

# inverse the letter if you want to get the reverse complement

# system('python retrieve_listOfFrequencies_from_matrixFile.py')

library(Cairo)
library(motifStack)

# a <- read.table("ARF2_matrix1_MEME_1500FirstSeq.txt",sep="\t",header=TRUE)
# svg(filename="ARF2_MEME_Matrix1_600FirstSeq.svg", 
#     width=600, 
#     height=400, 
#     pointsize=12)
# # Cairo(600, 400,type="svg", bg="white",file="ARF2_MEME_Matrix1_600FirstSeq.svg")
# b <- apply(a, 2, rev) #add this line if you want to get the reverse complement
# pfm <- t(as.matrix(b))
# print(pfm)
# plotMotifLogo(pfm)
# dev.off()
# system('ls')
a <- read.table(args[1], sep="\t", header=TRUE)
a<-data.frame(a[,4],a[,3],a[,2],a[,1])
names(a)<-c("T","G","C","A")
Cairo(600, 400, type="png", bg="white", file = paste(b, ".png",sep=""))
# CairoSVG("complete_ER7_from_sequences_frequences.svg",12,6, bg="white")
#a <- apply(a, 2, rev) 
pfm <- t(as.matrix(a))
plotMotifLogo(pfm)
dev.off()