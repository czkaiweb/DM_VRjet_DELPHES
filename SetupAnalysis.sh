#! /bin/sh
AnalysisName=$1
echo "Analysis $AnalysisName Setting..."
echo ""
mkdir $AnalysisName
cp    calchep_script/SetupCalcHEP.sh $AnalysisName
cp    calchep_script/README_CALCHEP_SETUP $AnalysisName
#cp    calchep_script/Storedata.sh $AnalysisName
chmod 755 $AnalysisName/SetupCalcHEP.sh
mkdir $AnalysisName/Delphes/
cp    CheckMATE_script/* $AnalysisName
mkdir $AnalysisName/data
mkdir $AnalysisName/Delphes_result
mkdir $AnalysisName/BoostedAnalysis
mkdir $AnalysisName/VariableRAnalysis
mkdir $AnalysisName/ResolvedAnalysis
