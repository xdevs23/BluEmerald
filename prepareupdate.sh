#!/bin/bash

APPTYPE="theme"
APPRELPATH="$APPTYPE/build/outputs/apk/$APPTYPE-release.apk"
APPNAME="BluEmerald"
UPDATEABLE="false"

if [ -z $1 ]; then echo "Usage: source prepareupdate.sh vername vercode vertype"
else
  if [ ! "$4" == "--updateOnly" ]; then source make.sh; fi
  if [ $UPDATEABLE == "true" ]; then cp "$APPRELPATH" "update/$APPNAME.apk"; fi
  cp "$APPRELPATH" "versions/$APPNAME-$1-$2-$3.apk"

  if [ $UPDATEABLE == "true" ]; then
    echo -en $1>update/version.txt
    echo -en $2>update/rel.txt

    nano update/changelog.txt
  fi
  git add -A
  git commit -m "update: $1-$2-$3"
fi
