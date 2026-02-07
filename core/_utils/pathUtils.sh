#!/bin/bash
DOWNLOADS_DIR="$HOME_LAB/downloads"
UNZIPPED_DIR="$DOWNLOADS_DIR/unzipped"
DEV_DIR="$HOME_LAB/dev"

#$1: Absolute path
isPathExists() {
  if find $1 -type d -regex '.*pattern.*' -print -quit 2>/dev/null; then
     echo "true"
  fi
}
isPathNotExists() {
  if [[ $(isPathExists $1) != "true" ]]; then
     echo "true"
  fi
}