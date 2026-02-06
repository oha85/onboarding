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
  if [[ "$(isPathNotExists $DOWNLOADS_DIR)" ]]; then
    mkdir $DOWNLOADS_DIR
    mkdir $UNZIPPED_DIR
  fi 
  if [[ "$(isFileNotDownloadedYet $url)" ]]; then
    wget -P $DOWNLOADS_DIR $url
  else {
    echo "File already downloaded. Skipping download."
    exit 0
  }
  fi
fi
