#!/bin/bash

#find . -name ".DS_Store" -delete
read -p "Press key to continue with find / -name "\.DS_Store"\ command..." -n1 -s
find / -name ".DS_Store"
read -p "Press key to continue with find / -type f -size +100M -exec ls -lh {} \; command..." -n1 -s
find / -type f -size +100M -exec ls -lh {} 
read -p "Press key to continue with du -hs * | sort -hr command..." -n1 -s
du -hs * | sort -hr
read -p "Press key to continue with ls -laSh command..." -n1 -s
ls -laSh
