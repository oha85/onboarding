#!/bin/bash
source core/_utils/helper.sh

#$1: OpenJDK full name
getOpenJdkVersion() {
  local pattern='_hotspot_\K.+(?=\.tar\.gz)'
  getSubstring $1 $pattern
}
#$1: Maven full name
getMavenVersion() {
   local pattern='apache-maven-\K.+(?=\-bin)'
   getSubstring $1 $pattern
}
getMavenFileNameWithoutSuffix() {
   local pattern='\K.+(?=\-bin)'
   getSubstring $1 $pattern
}
#$1: Filename
getVscodeVersion() {
   echo $1 | grep -Eo 'code_[0-9]+\.[0-9]+\.[0-9]'
}
#$1: url of software
getSoftwareVersion() {
  local openjdk_version=$(getOpenJdkVersion $1)
  local maven_version=$(getMavenVersion $1)
  local vscode_version=$(getVscodeVersion $1)
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
