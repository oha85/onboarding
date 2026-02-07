#!/bin/bash
source core/_utils/pathUtils.sh

if [[ "$(isPathNotExists $HOME_LAB)" ]]; then
  echo "Please set HOME_LAB environment variable before running this script."
  exit 1;
else
  core/01_download_softwares.sh
  core/02_unzip_softwares.sh
  #core/03_install_softwares.sh
  #cp set-env-var.sh to /home/tild/lab
fi
