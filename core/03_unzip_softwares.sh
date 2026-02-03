#!/bin/bash
if [ -z $HOME_LAB/downloads ]; then
    echo $HOME_LAB"/downloads doesn't exist";
    return;
fi
while IFS= read -r -d '' file; do
    echo "$file"
done < <(find "$HOME_LAB/downloads" -type f -print0)

#echo tar -xzf file.tar.gz
