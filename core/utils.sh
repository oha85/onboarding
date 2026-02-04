#!/bin/bash
#$1: Absolute path
isPathExists() {
  if find $1 -type d -regex '.*pattern.*' -print -quit 2>/dev/null; then
     echo "true"
  fi
}
isPathNotExists() {
  if [[ $(isPathExists $1) != "true" ]]; then
     echo "true"
  fi
}

#$1: String to substruct
#$2: Pattern to use for substructing
_getSubstring() {
  echo "$1" | grep -oP "$2"
}

#$1: OpenJDK full name
getOpenJdkVersion() {
  local pattern='_hotspot_\K.+(?=\.tar\.gz)'
 # local jdk8="OpenJDK8U-jdk_x64_linux_hotspot_8u472b08.tar.gz"
 # local jdk11="OpenJDK11U-jdk_x64_linux_hotspot_11.0.30_7.tar.gz"
 # local jdk17="OpenJDK17U-jdk_x64_linux_hotspot_17.0.18_8.tar.gz"
 # local jdk21="OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz"
 # local jdk25="OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz"
  _getSubstring $1 $pattern
#  echo jdk8 : $(_getSubstring $jdk8 $pattern)
 # echo
 # echo jdk11:  $(_getSubstring $jdk11 $pattern)
#  echo
#  echo jdk17: $(_getSubstring $jdk17 $pattern)
#  echo
#  echo jdk21: $(_getSubstring $jdk21 $pattern)
#  echo
#  echo jdk25: $(_getSubstring $jdk25 $pattern)
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