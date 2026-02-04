#!/bin/bash
source core/utils.sh
DOWNLOADS_DIR="$HOME_LAB/downloads"
if [[ "$(isPathNotExists "$DOWNLOADS_DIR" eq "true" )" ]]; then
  echo "$HOME_LAB/downloads doesn't exist."
  exit 1
else
  DEV_DIR=$HOME_LAB/dev
  if [[ "$(isPathNotExists "$DEV_DIR" eq "true" )" ]]; then
    mkdir $DEV_DIR
    echo "$DEV_DIR created."
  fi
  files=$(find $HOME_LAB/downloads/ -type f -name "*.tar.gz" -printf '%f\n')
  if [ -z "$files" ]; then
    echo "$DOWNLOADS_DIR doesn't contain any file to unzip."
    exit 1
  else
    for file in $files; do
    case $file in
      OpenJDK*)
        core/jdk/openjdk/unzip.sh $file 
      ;;
      apache-maven*)
        echo apacha-maven
        #core/jdk/maven/unzip.sh $file 
      ;;
      code_*)
        echo code_
        #core/vscode/unzip.sh $file
      ;;
      *)
        echo MIAOU
      ;;
    esac
  done
  fi
fi