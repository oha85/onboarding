#!/bin/bash

OPENJDK_PREFIX="OpenJDK"
OPENJDK_TARGZ_PATTERN='_hotspot_\K.+(?=\.tar\.gz)'

#$1: OpenJDK full name
_getOpenJdkVersion() {
  echo $OPENJDK_PREFIX $(getSubstring $1 $OPENJDK_TARGZ_PATTERN)
}
