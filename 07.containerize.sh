#!/bin/bash

. ./setEnv.sh
. ${SUIF_HOME}/01.scripts/commonFunctions.sh

# logI "Containerizing MS according to product default approach"
# cd "${SUIF_INSTALL_INSTALL_DIR}/IntegrationServer/docker"
# ./is_container.sh createDockerfile

logI "Containerizing IS with customized approach"

cp custom/* "${SUIF_INSTALL_INSTALL_DIR}"/

cd "${SUIF_INSTALL_INSTALL_DIR}"
logI "Building container"
buildah \
  --storage-opt mount_program=/usr/bin/fuse-overlayfs \
  --storage-opt ignore_chown_errors=true \
  bud --format docker -t "${AZ_ACR_CANONICAL_CONTAINER_IMAGE_FULL_NAME}"

contResult=$?
if [ "${contResult}" -ne 0 ]; then
  logE "Containerization failed, code ${contResult}"
  exit 1
fi

logI "Canonical container image created successfully"
