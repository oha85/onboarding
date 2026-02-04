#!/bin/bash
source core/utils.sh

if [[ "$(isPathExists "$HOME_LAB/downloads" eq "true" )" ]]; then
  if [[ -z "$(isPathExists "$HOME_LAB/dev")" ]]; then
    mkdir $HOME_LAB/dev
  fi
  files=$(find $HOME_LAB/downloads/ -type f -name "*.tar.gz" -printf '%f\n')
  if [ -z "$files" ]; then
   echo "$HOME_LAB/downloads doesn't contain any file to unzip."
   return 
  else
    for file in $files; do
    case $file in
      OpenJDK*)
        if [[ -z "$(isPathExists "$HOME_LAB/dev/jdk")" ]]; then
          mkdir $HOME_LAB/dev/jdk
	        mkdir $HOME_LAB/dev/jdk/openjdk
          echo "$HOME_LAB/dev/jdk/openjdk created."
        fi
        jdk_version=$(getOpenJdkVersion $file)
        mkdir $HOME_LAB/dev/jdk/openjdk/$jdk_version
        echo "$HOME_LAB/dev/jdk/openjdk created."
        #tar -zxvf "$HOME_LAB/downloads/$file" -C $HOME_LAB/dev/jdk/openjdk/$jdk_version
        #Remove tar.gi
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
