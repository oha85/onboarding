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
  if [[ "$(isPathExists $HOME_LAB/downloads)" ]]; then
    wget -P $HOME_LAB/downloads $url
  else
    echo "$HOME_LAB/downloads doesn't exist. Please create it before"
  fi 
fi

