# -*- coding: utf-8 -*-
import re
import os

F = open("Last_PWMs.txt","r")
matrix = F.read().replace("\r","\n") + "\n"
F.close()
TF = re.compile(r"(.*)\t\t")
TFName = TF.findall(matrix)
TFName = [s.replace('\t', '') for s in TFName]
#TFName = str(TFName)
print("TFName : ",TFName)
num = re.compile(r"([+-]?\d+[.,]\d+)")
Mdata = num.findall(matrix)
a = 0
for j in range(0, len(Mdata), 40) :
	matOccurence_verticale = []
	print("j : ",j)
	print("Mdata[j:j+40] : ",Mdata[j:j+40])
	subMdata = Mdata[j:j+40]
	file = open(TFName[a] + ".txt","w") 
	file.write(str("A\tC\tG\tT\t\n"))
	#print(11111111)
	for i in range(0,len(subMdata)/4):
		matOccurence_verticale.append(subMdata[i])
		matOccurence_verticale.append(subMdata[i+len(subMdata)/4])
		matOccurence_verticale.append(subMdata[i+(len(subMdata)/4)*2])
		matOccurence_verticale.append(subMdata[i+(len(subMdata)/4)*3])
	print(len(matOccurence_verticale)/4)
	print("matOccurence_verticale : ",matOccurence_verticale)
	for i in range(0 , len(matOccurence_verticale), 4) :	
		file.write(str(matOccurence_verticale[i]) + str("\t")) 
		file.write(str(matOccurence_verticale[i+1]) + str("\t")) 
		file.write(str(matOccurence_verticale[i+2]) + str("\t")) 
		file.write(str(matOccurence_verticale[i+3]) + str("\t")) 
		#if (i+1 == len(matOccurence_verticale)/4 or i+1 == 2*len(matOccurence_verticale)/4 or i+1 == 3*len(matOccurence_verticale)/4 )  :
		file.write(str("\n"))
	file.close() 
	os.system('Rscript --vanilla getMotifs.r '+ TFName[a] + '.txt')
	#os.system('ls')
	os.system('mkdir ' + TFName[a] + '_rep')
	os.system('mv ' + TFName[a] + '.txt ' + TFName[a] + '.png' + ' /home/ab250579/Documents/' + TFName[a] + '_rep')
	a = a + 1
	#file.write(str("\n") )
