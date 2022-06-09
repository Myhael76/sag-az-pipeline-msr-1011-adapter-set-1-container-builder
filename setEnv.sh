#!/bin/bash

# options
export MY_fixTag="22-06-06"
export MY_SUIF_TAG="v.0.3.0"
export MY_template="MSR/1011/AdaptersSet1"
export AZ_ACR_URL="miunsagimages.azurecr.io"
export AZ_ACR_REPO_NAME="sag-msr-1011-as1"

# change below only if you know the system well
export MY_d=$(date +%y-%m-%dT%H.%M.%S_%3N)
export MY_crtDay=$(date +%y-%m-%d)
export MY_wd="/tmp/work"        # our work directory
export MY_sd="/tmp/share"       # share directory - images
export MY_binDir="$MY_sd/bin"
export MY_installerSharedBin="$MY_binDir/installer.bin"
export MY_sumBootstrapSharedBin="$MY_binDir/sum-bootstrap.bin"
export AZ_ACR_CANONICAL_CONTAINER_IMAGE_FULL_NAME="${AZ_ACR_URL}/${AZ_ACR_REPO_NAME}:${MY_fixTag}"
# TODO: Besides Canonical customized images will be produced

# SUIF references
export SUIF_AUDIT_BASE_DIR=/tmp/SUIF_AUDIT
export SUIF_DEBUG_ON=0
export SUIF_FIXES_DATE_TAG="${MY_fixTag}"
export SUIF_INSTALL_IMAGE_FILE="./custom/products.zip"
export SUIF_INSTALL_INSTALL_DIR="/opt/softwareag"
export SUIF_INSTALL_INSTALLER_BIN="./custom/installer.bin"
export SUIF_INSTALL_TIME_ADMIN_PASSWORD=manage01
export SUIF_PATCH_FIXES_IMAGE_FILE="./custom/fixes.zip"
export SUIF_PATCH_SUM_BOOSTSTRAP_BIN="./custom/sum-bootstrap.bin"
export SUIF_HOME=/tmp/SUIF
