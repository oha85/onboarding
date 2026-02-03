#!/bin/bash
url=$1
maven_version=apache-maven-$(echo $url | grep -Po 'apache-maven-\K\d+')
echo
echo "Would you like to download " $maven_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/_download.sh $url $maven_version
else
   echo $maven_version "download is cancelled."
fi
