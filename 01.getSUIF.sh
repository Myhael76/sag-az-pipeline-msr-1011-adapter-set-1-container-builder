#!/bin/bash

. ./setEnv.sh

echo "Environment dump before SUIF download"
env | sort

mkdir -p "${SUIF_HOME}" "${SUIF_AUDIT_BASE_DIR}"
git clone -b "${MY_SUIF_TAG}" --single-branch https://github.com/SoftwareAG/sag-unattented-installations.git "${SUIF_HOME}"
if [ $? -ne 0 ]; then
  echo "ERROR downloading SUIF"
  exit 1
fi
if [ ! -f "${SUIF_HOME}/01.scripts/commonFunctions.sh" ]; then
  echo "SUIF clone unseccessful, cannot continue"
  exit 2
fi

. "${SUIF_HOME}/01.scripts/commonFunctions.sh"

logI "Preparing the installation folder"

sudo mkdir -p "${SUIF_INSTALL_INSTALL_DIR}"
sudo chmod a+w "${SUIF_INSTALL_INSTALL_DIR}"
