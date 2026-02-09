#!/bin/bash

DOWNLOADS_DIR="$HOME_LAB/downloads"
ARCHIVE_DIR="$DOWNLOADS_DIR/archives"
TMP_DIR="$DOWNLOADS_DIR/tmp"
DEV_DIR="$HOME_LAB/dev"
TARGZ_PATTERN='[^/]+\.tar\.gz$'

#$1: URL or Path to tar.gz file
_getTarGzFileName() {
   echo $1 | grep -Eo $TARGZ_PATTERN
}
#=$1: Absolute path to the file
_isFileNotExists() {
   if [[ -z "$(isFileExists $1)" ]]; then
     echo "true"
   fi
}
#$1: Absolute path
isPathNotExists() {
  if [[ $(isPathExists $1) != "true" ]]; then
     echo "true"
  fi
}
#$1: Absolute path
isPathExists() {
  if find $1 -type d -regex '.*pattern.*' -print -quit 2>/dev/null; then
     echo "true"
  fi
}
#$1: HTTP URL to tar.gz file
getFilenameFromUrl() {
   _getTarGzFileName $1
}
#=$1: Absolute path to the file
isFileExists() {
   local result=$(getLastFileFromPath $1)
   if [[ -n "$result" ]]; then
     echo "true"
   fi
}
#$1: Path to tar.gz file
getFilenameFromAbsolutePath() {
   _getTarGzFileName $1
}
#$1: Absolute path to the file
getLastFileFromPath() {
   echo $(ls "$1" 2>/dev/null)
}
#$1: Absolute path to folder
getLastFolderFromAbsolutePath() {
   echo ${1##*/}
}
#$1: Sub path to create
#$2: Parent path
createSubFolderStructureBasedOnSubPath() {
  local param=$1
  local result=$2
  IFS='/' read -ra parts <<< "$param"
  for part in "${parts[@]}"; do
    result=$result"/"$part
    mkdir $result
  done
}