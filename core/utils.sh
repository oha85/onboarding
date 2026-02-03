#!/bin/bash

isPathExists() {
  if find $1 -type d -regex '.*pattern.*' -print -quit 2>/dev/null; then
     echo "true"
  fi
}   
