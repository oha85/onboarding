#!/bin/bash
source core/utils.sh
if [[ -z "$(isPathExists $HOME_LAB)" ]]; then
  echo "Please set HOME_LAB environment variable before running this script."
  exit 1;
else
  #core/02_download_softwares.sh
  core/03_unzip_softwares.sh
  #core/04_install_softwares.sh
  #cp set-env-var.sh to /home/tild/lab
fi
