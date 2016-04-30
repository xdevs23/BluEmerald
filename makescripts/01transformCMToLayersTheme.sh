#!/bin/bash
echo ""
echo " --- Transform CM Themes to Layers"
if [ "$1" == "c" ]; then
  rm -rf ../layers/*
else
echo "  -- Script by xdevs23"
echo ""
echo ""
echo " - Initializing..."



THEMENAME="BluEmerald"

function echi() {
  echo " - $@"
}

if [ "${PWD##*/}" == "makescripts" ]; then cd ..; fi;

FIRSTDIR=$(pwd)

if [ ! -e "layers/" ]; then mkdir layers; fi

cd theme/src/main/assets/overlays

echi "Collecting overlay paths..."
ALLDIRS=$(ls)

echi "Zipping cm themes together..."

for word in $ALLDIRS
do
  zip -r $FIRSTDIR/layers/$THEMENAME_$(cat "../layerinfo/$word.txt").zip $word/
done

echi "Finalizing..."
cd "$FIRSTDIR"

fi
