#!/bin/bash

echo "Configuring..."
source configure.sh $1

echo "Starting build..."
./gradlew clean assembleAppDebug build

echo "Cleaning up..."
source makescripts/99cleanup.sh

echo "Build finished"
