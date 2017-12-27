#! /bin/sh
BatchName=$1

echo "Setting calchep as parton level generator"
. $CALCHEP_PATH/mkWORKdir

if [! -f "../calchep_script/batch/$BatchName"];then
	cp ../calchep_script/batch/$BatchName
else
	echo "Batch not found, try to add a batch manually"
fi
