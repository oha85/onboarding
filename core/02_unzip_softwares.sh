#!/bin/bash
source core/_utils/pathUtils.sh
source core/jdk/openjdk/_utils.sh
source core/maven/_utils.sh
source core/vscode/_utils.sh

#$1 tar.gz file to unzip
unzip() {
  case $1 in
    OpenJDK*)
      $RUN_UNZIP_SH_OPENJDK $1 
    ;;
    apache-maven*)
      $RUN_UNZIP_SH_MAVEN $1 
    ;;
    code_*)
      echo code_
      $RUN_UNZIP_SH_VSCODE $1
    ;;
    *)
      echo MIAOU
    ;;
  esac
}

getFilesToUnzip() {
  echo $(find $DOWNLOADS_DIR/ -type f -name "*.tar.gz" -printf '%f\n')
}

if [[ "$(isPathNotExists "$DOWNLOADS_DIR" eq "true" )" ]]; then
  echo "$DOWNLOADS_DIR doesn't exist."
  exit 1
else
  if [[ "$(isPathNotExists "$DEV_DIR" eq "true" )" ]]; then
    mkdir $DEV_DIR
    echo "$DEV_DIR created."
  fi
  #files=$(find $DOWNLOADS_DIR/ -type f -name "*.tar.gz" -printf '%f\n')
  files=$(getFilesToUnzip)
  if [ -z "$files" ]; then
    echo "$DOWNLOADS_DIR doesn't contain any file to unzip."
    exit 1
  else
    for file in $files; do
      unzip $file
  done
  fi
fi