#!/bin/bash

echo "Cleaning up..."

FIRSTDIR=$(pwd)

if [ ! "${PWD##*/}" == "makescripts" ]; then cd makescripts; fi

ALLSCRIPTS=$(ls)

for word in $ALLSCRIPTS; do
  if [ "$word" != "99cleanup.sh" ]; then
    source $word c
  fi
done

cd $FIRSTDIR

echo "Done!"

