#!/bin/bash

git clone -b "${MY_SUIF_TAG}" --single-branch https://github.com/SoftwareAG/sag-unattented-installations.git "${SUIF_HOME}"

. ${SUIF_HOME}/01.scripts/commonFunctions.sh
. ${SUIF_HOME}/01.scripts/installation/setupFunctions.sh

logI "SUIF env before installation:"
env | grep SUIF_ | sort

logI "Installing Product according to template MSR/1011/AdaptersSet1..."

applySetupTemplate "MSR/1011/AdaptersSet1"

installResult=$?

if [ "${installResult}" -ne 0 ]; then
  logE "Installation failed, code ${installResult}"
  exit 1
fi

logI "Product installation successful"