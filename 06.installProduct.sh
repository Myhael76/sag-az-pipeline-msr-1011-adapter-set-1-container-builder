#!/bin/bash

. ./setEnv.sh
. ${SUIF_HOME}/01.scripts/commonFunctions.sh
. ${SUIF_HOME}/01.scripts/installation/setupFunctions.sh

logI "SUIF env before installation:"
env | grep SUIF_ | sort

logI "Installing Product according to template ${MY_MSR_template}..."

applySetupTemplate "${MY_MSR_template}"

local installResult=$?

if [ "${installResult}" -ne 0 ]; then
  logE "Installation failed, code ${installResult}"
  exit 1
fi

logI "Product installation successful"