import sys
from ROOT import *
import re
from numpy import *
from math  import *
import os

dataname = sys.argv[1]
MY_input = sys.argv[3]
MF_input = sys.argv[4]
g_coupling = sys.argv[2]

#MF_l=[ i*50+200 for i in range(6) ]
#MY_l=[ i*100+500 for i in range(7)]
#gYqq_l=[ 0.05+i*0.05 for i in range(20)]
#gYgg_l=[ 0.01+i*0.01 for i in range(20)]

dirpath=os.path.abspath(os.curdir)
print dirpath
fin1 = open(dirpath+'/lhe-pythia8-delphes-default.dat',"r+")
fin2 = open(dirpath+'/pythia8card-default.dat',"r+")
if 'qq' in dataname:
	filename='gYqq'+g_coupling+'MY'+MY_input+'MF'+MF_input
if 'gg' in dataname:
	filename='gYgg'+g_coupling+'MY'+MY_input+'MF'+MF_input

print filename
fout1= open(dirpath+'/delphes_cards/'+filename+'-lhe-pythia8-delphes-default.dat',"w") #Full_
fout2= open(dirpath+'/delphes_cards/'+filename+'-pythia8card.dat',"w")	#Full

for pline1 in fin1:
	pline1n=str(pline1)
	if 'Name:' in pline1:
		pline1n=str(pline1.split()[0])+filename+'\n' #Full_
	if 'Pythia8Card:' in pline1:
		pline1n=str(pline1.split()[0])+dirpath+'/delphes_cards/'+filename+'-pythia8card.dat\n' #Full_
	fout1.write(pline1n);

for pline2 in fin2:
	pline2n=str(pline2)
	if 'Beams:LHEF==' in pline2:
		# $NAME should be replaced $AnalysisFolder/data/lhe-data/Prefix of Filename
		# e.g.  "Ys-Ff-DM-s-channel_hhmet_mdm_1_scan-" which is the Filename in calchep batch
		pline2n = str(pline2.split()[0])+dirpath+"/data/lhe_data/"+"$NAME"+filename+".lhe"
		print pline2n
        fout2.write(pline2n);

fout2.close()
