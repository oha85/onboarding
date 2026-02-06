#!/bin/bash
source core/_utils/pathUtils.sh
if [[ "$(isPathNotExists "$DOWNLOADS_DIR" eq "true" )" ]]; then
  echo "$DOWNLOADS_DIR doesn't exist."
  exit 1
else
  if [[ "$(isPathNotExists "$DEV_DIR" eq "true" )" ]]; then
    mkdir $DEV_DIR
    echo "$DEV_DIR created."
  fi
  files=$(find $DOWNLOADS_DIR/ -type f -name "*.tar.gz" -printf '%f\n')
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
        core/maven/unzip.sh $file 
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