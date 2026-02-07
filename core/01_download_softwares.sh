#!/bin/bash
source core/jdk/openjdk/_utils.sh
source core/maven/_utils.sh
source core/vscode/_utils.sh

read -p "Please confirm by pushing [Y] button to start downloading OpenJDK versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy] ]]; then 
   $RUN_DOWNLOAD_SH_OPENJDK
else 
   echo $SKIPPING_OPENJDK_DOWNLOAD
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading maven versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   $RUN_DOWNLOAD_SH_MAVEN
else
   echo $SKIPPING_MAVEN_DOWNLOAD
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading vscode: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   $RUN_DOWNLOAD_SH_VSCODE
else
   echo $SKIPPING_VSCODE_DOWNLOAD
fi
echo