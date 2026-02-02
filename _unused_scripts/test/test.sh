#!/bin/bash
DIRECTORY="/home/oualaa/media/DATA/ubuntu/shell/setup/test"

while IFS= read -r -d '' file; do
   jdk_version=$(echo ${file##*/} | grep -Po 'OpenJDK\K\d+')
   jdk_filename=
   case $jdk_version in
      8)
        jdk_filename=  



         command1 ;;
      pattern2|pattern3) command2 ;;
      *) default_command ;;
   esac






done < <(find "$DIRECTORY" -type f -print0)

