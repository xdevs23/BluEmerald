#/bin/sh

DBGAPKPATH="theme/build/outputs/apk/theme-appdebug.apk"

if [ -z "$1" ]; then source buildDebugApp.sh; fi

if [ "$1" == "-l" ]; then
  adb logcat -v tag -s Cornowser:*
elif [ "$1" == "--cleardata" ]; then
  adb shell pm clear io.xdevs23.theme.bluemerald.cm
elif [ "$1" == "-i" ]; then
  adb push $DBGAPKPATH /sdcard/BECustom.apk
  adb shell pm set-install-location 1
  adb shell pm install -rdtf /sdcard/BECustom.apk
elif [ "$1" == "--uninstall" ]; then
  adb shell pm uninstall io.xdevs23.theme.bluemerald.cm
elif [ "$1" == "--reinstall" ]; then
  adb shell pm uninstall io.xdevs23.theme.bluemerald.cm
  adb push $DBGAPKPATH /sdcard/BECustom.apk
  adb shell pm set-install-location 1
  adb shell pm install -rdtf /sdcard/BECustom.apk
else
  echo "Pushing to device..."
  adb push $DBGAPKPATH /sdcard/BECustom.apk
  echo "Trying to get root access..."
  adb root>/dev/null
  echo "Waiting for device..."
  adb wait-for-device
  echo "Installing..."
  adb shell pm set-install-location 1
  adb shell pm install -rdtf /sdcard/BECustom.apk
  echo "Applying default theme..."
  adb shell tm apply system
  sleep 2
  echo "Applying theme..."
  adb shell tm apply io.xdevs23.theme.bluemerald.cm
  sleep 20
  echo "Done!"
fi
