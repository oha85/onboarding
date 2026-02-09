#!/bin/bash
source core/_utils/pathUtils.sh
source core/_utils/softwareUtils.sh

JDK_DIR="$DEV_DIR/jdk"
OPENJDK_DIR="$JDK_DIR/openjdk"
if [[ "$(isPathNotExists "$JDK_DIR" eq "true" )" ]]; then
    mkdir $JDK_DIR
    mkdir $OPENJDK_DIR
    echo "$JDK_DIR created."
    echo "$OPENJDK_DIR created."
else
  if [[ "$(isPathNotExists "$OPENJDK_DIR" eq "true" )" ]]; then
    mkdir $OPENJDK_DIR
    echo "$OPENJDK_DIR created."
  fi
fi
file=$1
if [[ "$(isPathExists "$OPENJDK_DIR" eq "true" )" ]]; then
  jdk_version=$(getOpenJdkVersion $file)
  # FIXME: Doesn't untar when the file doesn't exist.
  exists=$(isFileExists "$DOWNLOADS_DIR/$filenameFromUrl")
  if [[ -z "$exists" ]]; then
    tar -xzvf "$DOWNLOADS_DIR/$file" -C $OPENJDK_DIR
    mv "$DOWNLOADS_DIR/$file" "$UNZIPPED_DIR"
  fi
fi
