#!/bin/bash
source core/utils.sh
DOWNLOADS_DIR="$HOME_LAB/downloads"
UNZIPPED_DIR="$DOWNLOADS_DIR/unzipped"
DEV_DIR="$HOME_LAB/dev"
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
  tar -xzvf "$DOWNLOADS_DIR/$file" -C $OPENJDK_DIR
  if [[ "$(isPathNotExists "$UNZIPPED_DIR" eq "true" )" ]]; then
    mkdir $UNZIPPED_DIR
    echo "$UNZIPPED_DIR created."
  fi
  mv "$OPENJDK_DIR/$jdk_version" "$UNZIPPED_DIR"
  echo "$OPENJDK_DIR/$jdk_version moved to $UNZIPPED_DIR"
fi