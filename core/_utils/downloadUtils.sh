#!/bin/bash
source core/_utils/fileUtils.sh
source core/_utils/untarUtils.sh
source core/jdk/openjdk/openJdkUtils.sh

CONST_ARCHIVED="ARCHIVED"
CONST_DOWNLOADED="DOWNLOADED"
CONST_UNTARRED="UNTARRED"

#$1 Path to folder where the file will be downloaded
#$2 URL of the file to download
_wgetVerbose() {
    wget -P $1 $2
}
#$1 Path to folder where the file will be downloaded
#$2 URL of the file to download
_wgetNotVerbose() {
    wget -P $1 $2 2>/dev/null
}
#$1 URL of the file to download
_wgetToTmpDir() {
    _wgetNotVerbose $TMP_DIR $1
}
#$1 URL of the file to download
_wgetToDownloadDir() {
    _wgetVerbose $DOWNLOADS_DIR $1
}
_createDownloadsFolderStructure() {
   if [[ "$(isPathNotExists $DOWNLOADS_DIR)" ]]; then
      mkdir $DOWNLOADS_DIR
      mkdir $ARCHIVE_DIR
      mkdir $TMP_DIR
      mkdir $DEV_DIR
   fi
}
#$1: filename
_isSoftwareAlreadyDownloaded() {
    local download="$(isFileExists "$DOWNLOADS_DIR/$1")"
    local archive=$(isFileExists "$ARCHIVE_DIR/$1")
    if [[ -n "$download" ]]; then
        echo "$CONST_DOWNLOADED"
    elif [[ -n "$archive" ]]; then
        echo "$CONST_ARCHIVED"
    fi
}
#$1 URL of the file to download
_isSoftwareAlreadyUntarred() {
    #_wgetToTmpDir $1
    local targzFile=$(getFilenameFromAbsolutePath $1)
    local pathToTargzFile=$TMP_DIR/$targzFile
    #untarIntoTmpDir $pathToTargzFile
    mv $pathToTargzFile $TMP_DIR/.$targzFile
    local untarredFolder=$(getLastFileFromPath "$TMP_DIR")
    local pathToUntarredFileTmp=$TMP_DIR/$untarredFolder
    local subFolder=$(_getSubFolder $1)
    local pathToUntarredFileDev=$DEV_DIR/$subFolder/$untarredFolder
    local isFolderExists=$(isFileExists $pathToUntarredFileDev)
    if [[ "$isFolderExists" == "true" ]]; then
      echo "$CONST_UNTARRED"
      rm -rf $TMP_DIR/*
    else 
        mv $TMP_DIR/.$targzFile $ARCHIVE_DIR/$targzFile
        createSubFolderStructureBasedOnSubPath $subFolder $DEV_DIR
        mv $TMP_DIR/* $DEV_DIR/$subFolder/
    fi
}
#$1: URL to the file
_getSubFolder () {
    case $software in
    $OPENJDK_PREFIX*)
        echo "jdk/openjdk"
    ;;
    *)
        echo "Erreur - Unknown software"
    ;;
   esac

}
#$1: URL to the file
_getSoftware() {
    local software=$(getFilenameFromUrl $1)
    case $software in
        $OPENJDK_PREFIX*)
            echo "$software"
        ;;
        *)
            echo "Erreur - Unknown software"
        ;;
   esac
}
#$1: URL to the file
execute() {
    local software=$(_getSoftware $1)
    echo "Would you like to download "$software "?"
    read -p "Please confirm by pushing [Y] button: " -n 1 -r
    echo
    if ! [[ $REPLY =~ ^[Yy]$ ]]; then
        echo $software "download is cancelled."
    else
        local result=$(_isSoftwareAlreadyUntarred $url)
        echo MIAOUUUUUUUUUUUU $result
        if [[ "$result" == "$CONST_UNTARRED" ]]; then
            echo "Software already installed."
        else
            _createDownloadsFolderStructure
            local url=$1
            local filename=$(getFilenameFromUrl $url)
            local result="$(_isSoftwareAlreadyDownloaded $filename)"
            if [[ "$result" == $CONST_DOWNLOADED ]]; then
                echo "Software already downloaded. Just untar it."
            elif [[ "$result" == $CONST_ARCHIVED ]]; then
                echo "Software already archived. Please move it to downloads folder to be untarred."
            else
                echo "Software downloaded."
            fi
        fi
    fi
}
