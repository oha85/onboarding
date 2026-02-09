#!/bin/bash
source core/_utils/fileUtils.sh

#$HOME_LAB env var.
if [[ "$(isPathNotExists $HOME_LAB)" ]]; then
  echo "Please create your HOME_LAB path and set its variable environment before running this script."
  exit 1;
else
  core/download_softwares.sh
  #core/unzip_softwares.sh
  #core/install_softwares.sh
  #cp set-env-var.sh to /home/tild/lab
fi
