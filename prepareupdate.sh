#!/bin/bash

APPRELPATH="app/build/outputs/apk/app-release.apk"
APPNAME="BluEmerald"
UPDATEABLE=false

if [ -z $1 ]; then echo "Usage: $0 vername vercode vertype"
else
  if [ ! "$4" == "--updateOnly" ]; then source make.sh; fi
  if [ UPDATEABLE ]; then cp "$APPRELPATH" "update/$APPNAME.apk"; fi
  cp "$APPRELPATH" "versions/$APPNAME-$1-$2$3.apk"

  if [ UPDATEABLE ]; then
    echo -en $1>update/version.txt
    echo -en $2>update/rel.txt

    nano update/changelog.txt
  fi
fi
