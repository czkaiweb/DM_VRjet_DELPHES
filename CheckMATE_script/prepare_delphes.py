import sys
from ROOT import *
import re
from numpy import *
from math  import *

dataname = sys.argv[1]
MY_input = sys.argv[3]
MF_input = sys.argv[4]
g_coupling = sys.argv[2]
MF_l=[ i*50+200 for i in range(6) ]
MY_l=[ i*100+500 for i in range(7)]
gYqq_l=[ 0.05+i*0.05 for i in range(20)]
gYgg_l=[ 0.01+i*0.01 for i in range(20)]

dir="/home/weikai/work/calchep/delphes/"
print dir
fin1 = open(dir+'lhe-pythia8-delphes-default.dat',"r+")
fin2 = open(dir+'pythia8card-default.dat',"r+")
if 'qq' in dataname:
	filename='gYqq'+g_coupling+'MY'+MY_input+'MF'+MF_input
if 'gg' in dataname:
	filename='gYgg'+g_coupling+'MY'+MY_input+'MF'+MF_input

print filename
fout1= open(dir+'delphes_cards/'+filename+'-lhe-pythia8-delphes-default.dat',"w") #Full_
fout2= open(dir+'delphes_cards/'+filename+'-pythia8card.dat',"w")	#Full

for pline1 in fin1:
	pline1n=str(pline1)
	if 'Name:' in pline1:
		pline1n=str(pline1.split()[0])+filename+'\n' #Full_
	if 'Pythia8Card:' in pline1:
		pline1n=str(pline1.split()[0])+dir+'delphes_cards/'+filename+'-pythia8card.dat\n' #Full_
	fout1.write(pline1n);

for pline2 in fin2:
	pline2n=str(pline2)
	if 'Beams:LHEF==' in pline2:
		pline2n = str(pline2.split()[0])+"/home/weikai/work/calchep/data/"+dataname+"/Simplified_HHMET-"+filename+".lhe"
		print pline2n
        fout2.write(pline2n);

fout2.close()
