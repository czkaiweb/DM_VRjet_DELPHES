#!/bin/sh
trgDir=
datename=$(date +%Y%m%d-%H%M%S)  
mkdir ../data/lhe_data
mkdir ../data/numerical 

mv Events/*.lhe.gz ../data/${trgDir}/lhe_data

mv html/numerical.txt ../data/${trgDir}/numerical/numerical_${datename}.txt

cat numerical_*.txt | sort | uniq > xsec.txt

gunzip ../data/lhe/*.lhe.gz

