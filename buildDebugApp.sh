#!/bin/bash

echo "Configuring..."
source configure.sh $1
gwamadbg__trc_icicoh__l=$?
[ $gwamadbg__trc_icicoh__l -ne 0 ] && return $gwamadbg__trc_icicoh__l

echo "Starting build..."
[ "$1" == "nocert" ] && ./gradlew assembleDebug || ./gradlew assembleAppDebug
gwamadbg__trc_icicoh__l=$?

#echo "Cleaning up..."
source makescripts/99cleanup.sh
gwamadbg__trc_icicoh__l=$?

echo "Build finished"

return $gwamadbg__trc_icicoh__l
exit $gwamadb__trc_icicoh__l
