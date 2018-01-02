#! /bin/sh

BACKUP_PATH="$CHECKMATE_PATH/data/cards_original"
if [ ! -d "$BACKUP_PATH" ]; then
	cp -r  $CHECKMATE_PATH/data/cards $CHECKMATE_PATH/data/cards_original
else
	echo "cards backup already stored"
fi

cp Delphes/detector_cards/delphes_skimmed_ATLAS_13TeV.tcl $CHECKMATE_PATH/data/cards

