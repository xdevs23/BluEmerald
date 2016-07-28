#!/bin/bash

echo "Configuring..."
source configure.sh

echo "Building..."
./gradlew clean build connectedCheck assembleRelease clean build

#echo "Cleaning up..."
#source makescripts/99cleanup.sh

echo "Build finished!"
