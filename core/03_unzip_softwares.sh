#!/bin/bash
if [ -z $HOME_LAB/downloads ]; then
    echo $HOME_LAB"/downloads doesn't exist";
    return;
fi
files=$(find $HOME_LAB/downloads/ -type f -name "*.tar.gz" -printf '%f\n')
for file in $files; do
  case $file in
    OpenJDK*)
      echo OpenJDK
    ;;
   apache-maven*)
      echo apacha-maven
    ;;
    *)
    echo MIAOU
    ;;
  esac
done



#while IFS= read -r -d '' file; do
 #   echo "$file"
#done < <(find "$HOME_LAB/downloads" -type f -print0)

#find $HOME_LAB/downloads/ -type f -name "*.tar.gz" ! -print

#echo tar -xzf file.tar.gz
