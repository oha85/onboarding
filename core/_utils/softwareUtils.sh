#!/bin/bash
source core/_utils/helper.sh
source core/jdk/openjdk/_utils.sh
source core/maven/_utils.sh
source core/vscode/_utils.sh
DOWNLOADED="downloaded"
PROCESSED="processed"
UNZIPPED="unzipped"

#$1: url of software
getSoftwareVersion() {
  local openjdk_version=$(getOpenJdkVersion $1)
  local maven_version=$(getMavenVersion $1)
  local vscode_version=$(getVscodeVersion $1)
  if [ -n "$openjdk_version" ]; then
     echo "$OPENJDK_PREFIX $openjdk_version"
  elif [ -n "$maven_version" ]; then
     echo "$MAVEN_PREFIX-$maven_version"
  elif [ -n "$vscode_version" ]; then
     echo "$vscode_version"
  else
     echo "Erreur - Unknown software"
  fi
}
#$1: URL to tar.gz file
getSoftwareFileNameFromUrl() {
   echo $1 | grep -Eo '[^/]+\.tar\.gz$' 
}
#$1: URL to the file
isSoftwareAlreadyProcessed() {
   local processed=$(isSoftwareAlreadyDownloaded $1)
   if [[ -n "$processed" ]]; then
     echo "$DOWNLOADED"
   else {
      processed=$(isSoftwareAlreadyUnzipped $1)
      if [[ -n "$processed" ]]; then
         echo "$UNZIPPED"
      fi
   }   
   fi
}
#$1: URL to the file
isSoftwareAlreadyDownloaded() {
   local filenameFromUrl=$(getSoftwareFileNameFromUrl $1)
   local filenameFromPath=$(ls "$DOWNLOADS_DIR/$filenameFromUrl" 2>/dev/null)
   if [[ -n "$filenameFromPath" ]]; then
     echo "true"
   fi
}
#$1: URL to the file
getUnzippedFoldername() {
    case $1 in
      $OPENJDK_PREFIX*)
         getOpenJdkUnzippedFoldername $1
      ;;
      $MAVEN_PREFIX*)
         getMavenUnzippedFoldername $1
      ;;
      $VSCODE_PREFIX*)
         getVscodeUnzippedFoldername $1
      ;;
      *)
        echo MIAOU
      ;;
    esac
}
#$1: URL to the file
isSoftwareAlreadyUnzipped() {
   #1. Get the filename from the URL
   local filenameFromUrl=$(getSoftwareFileNameFromUrl $1)
   local unzippedFoldername=$(getUnzippedFoldername $filenameFromUrl)
   local filenameFromPath=$(ls "$UNZIPPED_DIR/$unzippedFoldername" 2>/dev/null)
   if [[ -n "$filenameFromPath" ]]; then
     echo "true"
   fi
}
