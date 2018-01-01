#! /bin/sh

EventName=$1
BatchName=$2
DIR=$(dirname `pwd`/$0)
echo "Setting calchep as parton level generator"
. $CALCHEP_PATH/mkWORKdir $EventName
cp -r  $DIR/../calchep_script/batch $DIR
cp $DIR/../calchep_script/Storedata.sh $DIR/${EventName}
sed -i s/trgDir=/trgDir=${EventName}/g $DIR/${EventName}/Storedata.sh
chmod 755 $DIR/${EventName}/Storedata.sh

BatchFile="$DIR/batch/$BatchName"

if [ -e "$BatchFile" ]; then
	cp $DIR/batch/$BatchName $DIR/${EventName}
else
	echo "Batch not found, try to add a batch manually"
fi


