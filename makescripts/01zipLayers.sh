#!/bin/bash

if [ "$1" == "c" ]; then
  rm -rf ../theme/src/main/assets/Files/
  return 0
fi

echo "Making layers themes..."

for theme in $(ls theme/layers/Files/theme/); do
  mkdir -p theme/src/main/assets/Files/theme/
  zip -r theme/src/main/assets/Files/theme/$theme.apk theme/layers/Files/theme/$theme/*
done

zip -r theme/src/main/assets/Files/theme.zip theme/src/main/assets/Files/theme/*
rm -rf theme/src/main/assets/Files/theme/


echo "Layers theme built."
