#!/bin/bash
source core/_utils/helper.sh
source core/_utils/pathUtils.sh
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
isSoftwareAlreadyUnzipped() {
   #1. Get the filename from the URL
   local filenameFromUrl=$(getSoftwareFileNameFromUrl $1)
   local unzippedFoldername=$(
      
       $filenameFromUrl)
   isFileExists "$UNZIPPED_DIR/$unzippedFoldername"
   #local filenameFromPath=$(ls "$UNZIPPED_DIR/$unzippedFoldername" 2>/dev/null)
   #if [[ -n "$filenameFromPath" ]]; then
    # echo "true"
   #fi
}
#!/bin/bash
source core/_utils/softwareUtils.sh
source core/_utils/pathUtils.sh

url=$1

echo
software_version=$(getSoftwareVersion $url)
echo "Would you like to download "$software_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then
   echo $software_version "download is cancelled."
   exit
else
  if [[ "$(isPathNotExists $DOWNLOADS_DIR)" ]]; then
    mkdir $DOWNLOADS_DIR
    mkdir $UNZIPPED_DIR
  fi
  processed=$(isSoftwareAlreadyProcessed $url)
   if [[ "$processed" == $UNZIPPED ]]; then
     echo "File already unzipped."
     exit
   elif [[ "$processed" == $DOWNLOADED ]]; then
     echo "File already downloaded. Just unzip it."
     exit
   else
    wget -P $DOWNLOADS_DIR $url
  fi
fi
: << 'FIN_COMMENTAIRE'
read -p "Please confirm by pushing [Y] button to start downloading maven versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   $RUN_DOWNLOAD_SH_MAVEN
else
   echo $SKIPPING_MAVEN_DOWNLOAD
fi
read -p "Please confirm by pushing [Y] button to start downloading vscode: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   $RUN_DOWNLOAD_SH_VSCODE
else
   echo $SKIPPING_VSCODE_DOWNLOAD
fi
FIN_COMMENTAIRE
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

RUN_UNZIP_SH_OPENJDK="core/jdk/openjdk/unzip.sh"


#$1: OpenJDK full name
getOpenJdkVersion() {
  local pattern='_hotspot_\K.+(?=\.tar\.gz)'
  getSubstring $1 $pattern
}
: << 'FIN_COMMENTAIRE'
_getSoftwareVersion() {
  local openjdk_version=$(getOpenJdkVersion $1)
  if [ -n "$openjdk_version" ]; then
     echo "$OPENJDK_PREFIX $openjdk_version"
  else
     echo "Erreur - Unknown software"
  fi
}
FIN_COMMENTAIRE

#$1: URL to the file
_getSoftware() {
    local software=$(getFilenameFromUrl $1)
    case $software in
        $OPENJDK_PREFIX*)
            echo "$FOLDERNAME_8u472b08"
        ;;
        *)
            echo ""
        ;;
   esac
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