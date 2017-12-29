#! /bin/sh

EventName=$1
BatchName=$2

echo "Setting calchep as parton level generator"
. $CALCHEP_PATH/mkWORKdir $1

cp ../calchep_script/Storedata.sh ./$1/Storedata.sh
sed -i s/trgDir=/trgDir=${EventName}/g ./$1/Storedata.sh
chmod 755 ./$1/Storedata.sh


if [! -f "../calchep_script/batch/$BatchName"];then
	cp ../calchep_script/batch/$BatchName
else
	echo "Batch not found, try to add a batch manually"
fi


