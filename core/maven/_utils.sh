#!/bin/bash
MAVEN="Maven"
MAVEN_PREFIX="apache-maven"
RUN_UNZIP_SH_MAVEN="core/maven/unzip.sh"
RUN_DOWNLOAD_SH_MAVEN="core/maven/download/download.sh"
SKIPPING_MAVEN_DOWNLOAD="Skipping downloading Maven versions."
FOLDERNAME_3912="3.9.12"
FOLDERNAME_400rc5="4.0.0-rc-5"
TARGZ_3912="apache-maven-3.9.12-bin.tar.gz"
TARGZ_400rc5="apache-maven-4.0.0-rc-5-bin.tar.gz"

#$1: Maven full name
getMavenVersion() {
   local pattern='apache-maven-\K.+(?=\-bin)'
   getSubstring $1 $pattern
}
getMavenFileNameWithoutSuffix() {
   local pattern='\K.+(?=\-bin)'
   getSubstring $1 $pattern
}
#$1: Filename in   URL
getMavenUnzippedFoldername() {
   case $1 in
      TARGZ_3912)
         echo "$FOLDERNAME_3912"
      ;;
      TARGZ_400rc5)
         echo "$FOLDERNAME_400rc5"
      ;;
      *)
        echo ""
      ;;
   esac
}