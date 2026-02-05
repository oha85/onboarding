#!/bin/bash
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