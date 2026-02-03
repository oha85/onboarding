#!/bin/bash
url=$1
getSoftware() {
  local openjdk_version=$(echo $url | grep -Po 'OpenJDK\K\d+')
  local maven_version=$(echo $url | grep -Po 'apache-maven-\K\d+')
  local vscode_version=$(echo $url | grep -Eo 'code_[0-9]+\.[0-9]+\.[0-9]')
  if [ -n "$openjdk_version" ]; then
     echo $"OpenJDK$openjdk_version"
  elif [ -n "$maven_version" ]; then
     echo $"apache-maven-$maven_version"
  elif [ -n "$vscode_version" ]; then
     echo $"$vscode_version"
  else
     echo "Erreur - Unknown software"
  fi
}
echo
software_version=$(getSoftware)
echo "Would you like to download" $software_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
   echo $software "download is cancelled."
   exit
fi
source core/utils.sh
if [[ -z "$(isPathExists $HOME_LAB)" ]]; then
    echo "Please set HOME_LAB environment variable before running this script."
    exit
fi
wget -P $HOME_LAB/downloads $1
