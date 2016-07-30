#!/bin/bash

MYPWD="$(pwd)"

if [ "$1" == "c" ]; then
  rm -rf ../theme/src/main/assets/overlays/
  rm -rf ../cmtheme/resolved
  rm -rf ../cmtheme/intermediates
  echo "makeResolvedOverlays: symlinking overlays-cm..."
  ln -sf ../../../../cmtheme/overlays/ ../theme/src/main/assets/overlays-cm
  return 0
fi


echo "Making resolved overlays..."

cd cmtheme
java -jar DTT.jar nogui direct transform to=oms id=overlays/ od=intermediates/
cd $MYPWD
mv cmtheme/intermediates/assets/overlays cmtheme/resolved

echo "Copying resolved overlays..."

cp -R cmtheme/resolved theme/src/main/assets/overlays

echo "Removing overlays-cm temporarily..."

rm theme/src/main/assets/overlays-cm

echo "2-in-1 package is ready."
