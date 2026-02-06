#!/bin/bash
source core/_utils/softwareUtils.sh
source core/_utils/pathUtils.sh

MAVEN_DIR="$DEV_DIR/maven"
if [[ "$(isPathNotExists "$MAVEN_DIR" eq "true" )" ]]; then
    mkdir $MAVEN_DIR
    echo "$MAVEN_DIR created."
fi
file=$1
if [[ "$(isPathExists "$MAVEN_DIR" eq "true" )" ]]; then
  maven_version=$(getMavenVersion $file)
  maven_filename_without_extension=$(getMavenFileNameWithoutSuffix $file)
  tar -xzvf "$DOWNLOADS_DIR/$file" -C $MAVEN_DIR
  mv "$MAVEN_DIR/$maven_filename_without_extension" "$MAVEN_DIR/$maven_version"
  mv "$DOWNLOADS_DIR/$file" "$UNZIPPED_DIR/"
fi