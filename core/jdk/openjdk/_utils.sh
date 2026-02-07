#!/bin/bash

FOLDERNAME_8u472b08="jdk8u472-b08"
FOLDERNAME_110307="jdk-11.0.30+7"
FOLDERNAME_170188="jdk-17.0.1+12"
FOLDERNAME_210107="jdk-21.0.10+7"
FOLDERNAME_250210="jdk-25.0.2+10"
TARGZ_8u472b08="OPENJDK8U-jdk_x64_linux_hotspot_8u472b08.tar.gz"
TARGZ_110307="OPENJDK11U-jdk_x64_linux_hotspot_11.0.30_7.tar.gz"
TARGZ_170188="OPENJDK17U-jdk_x64_linux_hotspot_17.0.1_12.tar.gz"
TARGZ_210107="OpenJDK21U-jdk_x64_linux_hotspot_21.0.10_7.tar.gz"
TARGZ_250210="OpenJDK25U-jdk_x64_linux_hotspot_25.0.2_10.tar.gz"
OPENJDK_PREFIX="OpenJDK"
RUN_UNZIP_SH_OPENJDK="core/jdk/openjdk/unzip.sh"
RUN_DOWNLOAD_SH_OPENJDK="core/jdk/openjdk/download/download.sh"
SKIPPING_OPENJDK_DOWNLOAD="Skipping downloading OpenJDK versions."

#$1: OpenJDK full name
getOpenJdkVersion() {
  local pattern='_hotspot_\K.+(?=\.tar\.gz)'
  getSubstring $1 $pattern
}

#$1: Filename in the URL
getOpenJdkUnzippedFoldername() {
   case $1 in
      TARGZ_8u472b08)
         echo "$FOLDERNAME_8u472b08"
      ;;
      TARGZ_110307)
         echo "$FOLDERNAME_110307"
      ;;
      TARGZ_170188)
         echo "$FOLDERNAME_170188"
      ;;
      TARGZ_210107)
         echo "$FOLDERNAME_210107"
      ;;
      TARGZ_250210)
         echo "$FOLDERNAME_250210"
      ;;
      *)
        echo ""
      ;;
   esac
}