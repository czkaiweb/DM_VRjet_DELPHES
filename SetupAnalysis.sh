#! /bin/sh
AnalysisName=$1
echo "Analysis $AnalysisName Setting..."
echo ""
mkdir $AnalysisName
mkdir $AnalysisName/Delphes/
mkdir $AnalysisName/data
mkdir $AnalysisName/Delphes_result
mkdir $AnalysisName/BoostedAnalysis
mkdir $AnalysisName/VariableRAnalysis
mkdir $AnalysisName/ResolvedAnalysis
