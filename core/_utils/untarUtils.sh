#!/bin/bash
source core/_utils/fileUtils.sh

#$1: Absolute path to the tar.gz file
#$2: Absolute path to the destination folder
_untar() {
    tar -xzvf "$1" -C $2
}
#$1: Absolute path to the tar.gz file
untarIntoTmpDir() {
    tar -xzvf "$1" -C $TMP_DIR
}
#$1: Absolute path to the tar.gz file.
untarIntoDev() {
    tar -xzvf "$1" -C $DEV_DIR
}