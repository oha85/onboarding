#!/bin/bash

#$1: String to substruct
#$2: Pattern to use for substructing
getSubstring() {
  echo "$1" | grep -oP "$2"
}
