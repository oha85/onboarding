#!/bin/bash
source core/_utils/softwareUtils.sh
source core/_utils/pathUtils.sh

url=$1

echo
software_version=$(getSoftwareVersion $url)
echo "Would you like to download "$software_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
   echo $software_version "download is cancelled."
   exit
else
  if [[ "$(isPathNotExists $DOWNLOADS_DIR)" ]]; then
    mkdir $DOWNLOADS_DIR
    mkdir $UNZIPPED_DIR
  fi
  processed=$(isSoftwareAlreadyProcessed $url)
   if [[ "$processed" == $UNZIPPED ]]; then
     echo "File already unzipped."
     exit
   elif [[ "$processed" == $DOWNLOADED ]]; then
     echo "File already downloaded. Just unzip it."
     exit
   else
    wget -P $DOWNLOADS_DIR $url
  fi
fi
