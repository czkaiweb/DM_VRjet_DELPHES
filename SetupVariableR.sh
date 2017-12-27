#! /bin/sh

cp -r VariableR_jet/VariableR $DELPHES_PATH/external/fastjet/contribs
mkdir $DELPHES_PATH/modules/FastJetFinder_default
mv    $DELPHES_PATH/modules/FastJetFinder.*  $DELPHES_PATH/modules/FastJetFinder_default
cp    JetAlgoModification/FastJetFinder.* $DELPHES_PATH/modules

