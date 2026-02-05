#!/bin/bash
source core/_utils/helper.sh

#$1: OpenJDK full name
getOpenJdkVersion() {
  local pattern='_hotspot_\K.+(?=\.tar\.gz)'
  getSubstring $1 $pattern
}

#$1: Maven full name
getMavenVersion() {
  local pattern='apache-maven-\K\d+\.\d+\.\d+(?=\.tar\.gz)'
  getSubstring $1 $pattern
}

#$1: url of software
getSoftwareVersion() {
  local openjdk_version=$(echo $1 | grep -Po 'OpenJDK\K\d+')
  local maven_version=$(echo $1 | grep -Po 'apache-maven-\K\d+')
  local vscode_version=$(echo $1 | grep -Eo 'code_[0-9]+\.[0-9]+\.[0-9]')
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