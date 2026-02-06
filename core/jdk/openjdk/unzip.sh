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
  tar -xzvf "$DOWNLOADS_DIR/$file" -C $OPENJDK_DIR
  mv "$OPENJDK_DIR/$file" "$OPENJDK_DIR/$jdk_version"
  mv "$OPENJDK_DIR/$jdk_version" "$UNZIPPED_DIR"
fi
