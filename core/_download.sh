#!/bin/bash
url=$1
source core/_utils/softwareUtils.sh
source core/_utils/pathUtils.sh
echo
software_version=$(getSoftwareVersion $url)
echo "Would you like to download" $software_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
   echo $software "download is cancelled."
   exit
else
  if [[ "$(isPathNotExists $HOME_LAB/downloads)" ]]; then
    mkdir $HOME_LAB/downloads
    mkdir $HOME_LAB/downloads/unzipped
  fi 
  if [[ "$(isFileNotDownloadedYet $url)" ]]; then
    wget -P $HOME_LAB/downloads $url
  else {
    echo "File already downloaded. Skipping download."
    exit 0
  }
  fi
fi
