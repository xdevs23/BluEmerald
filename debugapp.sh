#/bin/sh

DBGAPKPATH="app/build/outputs/apk/app-appdebug.apk"

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
  adb push $DBGAPKPATH /sdcard/BECustom.apk
  adb root>/dev/null
  adb wait-for-device
  adb shell pm set-install-location 1
  adb shell pm install -rdtf /sdcard/BECustom.apk
fi
