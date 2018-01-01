#!/bin/bash

date
mode=$1
coupling=$2
gstart=5
gend=50
ystart=600
yend=1300
fstart=200
fend=650
chmod 755 ./run_script/*.sh

while [ $gstart -le $gend ]; do
	echo $gstart 
	while [ $ystart -le $yend ]; do
		echo $ystart
		while [ $fstart -le $fend ]; do
		    echo $ystart $fstart
		    cp run.con run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
	#	    echo "Arguments      = $index" >> run_$index.con 
		    echo "Executable     = run_script/run_${1}_${coupling}_${gstart}_MY_${ystart}_MF_${fstart}.sh">>run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
		    echo "Output         = log/job_${coupling}_${gstart}_${ystart}_${fstart}.out" >> run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
		    echo "Error          = log/job_${coupling}_${gstart}_${ystart}_${fstart}.err" >> run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
		    echo "Log            = log/job_${coupling}_${gstart}_${ystart}_${fstart}.log" >> run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
		    echo "Queue"         >> run_$coupling'_'$gstart'_'$ystart'_'$fstart.con
    
		    condor_submit run_$coupling'_'$gstart'_'$ystart'_'$fstart.con 
              
		    mv run_$coupling'_'$gstart'_'$ystart'_'$fstart.con script/     
		    let "fstart+=50";
    		done
		let "ystart+=100";
		fstart="200"
	done
	let "gstart+=5";
	ystart="600"
done
	
