#!/bin/bash
VSCODE="Vscode"
VSCODE_PREFIX="code_"
RUN_UNZIP_SH_VSCODE="core/vscode/unzip.sh"
RUN_DOWNLOAD_SH_VSCODE="core/vscode/download.sh"
SKIPPING_VSCODE_DOWNLOAD="Skipping downloading Vscode versions."

#$1: Filename
getVscodeVersion() {
   echo $1 | grep -Eo 'code_[0-9]+\.[0-9]+\.[0-9]'
}
#$1: Filename in the URL
getVscodeUnzippedFoldername() {
   case $1 in
      VSCODE_PREFIX)
         echo "MIAOU VSCODE"
      ;;
      *)
        echo ""
      ;;
   esac
}