#!/bin/bash
source core/utils.sh
if [[ "$(isPathExists "$HOME_LAB/downloads" eq "true" )" ]]; then
  if [[ "$(isPathExists "$HOME_LAB/dev" eq "true" )" ]]; then
    mkdir $HOME_LAB/dev
    echo "$HOME_LAB/dev created."
  fi
  files=$(find $HOME_LAB/downloads/ -type f -name "*.tar.gz" -printf '%f\n')
  if [ -z "$files" ]; then
   echo "$HOME_LAB/downloads doesn't contain any file to unzip."
   return 
  else
    for file in $files; do
    case $file in
      OpenJDK*)
        echo OpenJDK
        local $OPENJDK_DIR=$HOME_LAB/dev/jdk/openjdk
        if [[ -z "$(isPathExists $HOME_LAB/dev/jdk)" ]]; then
          mkdir $HOME_LAB/dev/jdk
	  mkdir $HOME_LAB/dev/jdk/openjdk
        fi
        mkdir $OPENJDK_DIR/
        local jdk_version=getOpenJdkVersion $file
        echo tar -zxvf "$HOME_LAB/downloads/$file" -C $HOME_LAB/dev/jdk/openjdk/$jdk_version
      ;;
      apache-maven*)
        echo apacha-maven
      ;;
      *)
        echo MIAOU
      ;;
    esac
  done
  fi
else
 echo "$HOME_LAB/downloads doesn't exist. Please create it before."
 exit 1
fi

#1. Lire tous les fichiez zip dans le répertoire download.
#2. Unzip all tar.gz files to specific location.
#3. Remove tar.gi

#J'ai besoin d'une expression régulière qui extrait le résultat "11.0.30_7" depuis la chaine "OpenJDK11U-jdk_x64_linux_hotspot_11.0.30_7.tar.gz"


