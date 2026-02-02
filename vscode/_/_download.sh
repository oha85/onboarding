#!/bin/bash

url=$1
vscode_version=vscode_1.108.2
echo
echo "Would you like to download " $vscode_version "?"
read -p "Please confirm by pushing [Y] button: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
   ./_/_download.sh $url $vscode_version
else
   echo $vscode_version "download is cancelled."
fi
