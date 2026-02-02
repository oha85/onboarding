#!/bin/bash

url=$1
openjdk_version=OpenJDK$(echo $url | grep -Po 'OpenJDK\K\d+')
echo
echo "Would you like to download " $openjdk_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/_download.sh $url $openjdk_version
else
   echo $openjdk_version "download is cancelled."
fi
