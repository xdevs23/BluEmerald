#!/bin/bash

echo "Configuring..."
source configure.sh $1

echo "Starting build..."
[ "$1" == "nocert" ] && ./gradlew assembleDebug || ./gradlew assembleAppDebug

#echo "Cleaning up..."
source makescripts/99cleanup.sh

echo "Build finished"
