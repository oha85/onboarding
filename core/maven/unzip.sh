#!/bin/bash
source core/_utils/softwareUtils.sh
source core/_utils/pathUtils.sh
DOWNLOADS_DIR="$HOME_LAB/downloads"
DEV_DIR="$HOME_LAB/dev"
MAVEN_DIR="$DEV_DIR/maven"
if [[ "$(isPathNotExists "$MAVEN_DIR" eq "true" )" ]]; then
    mkdir $MAVEN_DIR
    echo "$MAVEN_DIR created."
fi
file=$1
if [[ "$(isPathExists "$MAVEN_DIR" eq "true" )" ]]; then
  maven_version=$(getMavenVersion $file)
  tar -xzvf "$DOWNLOADS_DIR/$file" -C $MAVEN_DIR
fi