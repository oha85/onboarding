#!/bin/bash

echo "Would you like to create the folder structure ?"
read -p "Please confirm by pushing [Y] button " -n 1 -r
echo
if ! [[ $REPLY =~ ^[Yy]$ ]]; then 
  echo "Folder struture creation cancelled."
  return
fi

echo "Please provide the absolute path to where your home lab directory will be created. example: ~/homelab."
read -p "ROOT_DIR=" v_root_dir
if ! [[ "$v_root_dir" =~ ^/ ]]; then
   echo "Absolute path is not correct."  
   return
fi

export v_home_lab="$v_root_dir"/homelab
echo "Your home lab will be created at: " $v_home_lab
read -p "Please confirm by pushing [Y] button " -n 1 -r   
echo
if ! [[ $REPLY =~ ^[Yy] ]]; then
   echo "Folder struture creation cancelled."  
   return
fi

mkdir $v_home_lab
if ! [ $? -eq 0 ]; then
   echo "Folder structure creation not completed."
   export HOME_LAB=$v_home_lab
   return
fi

mkdir $v_home_lab/dev
if ! [ $? -eq 0 ]; then
   echo "Folder structure creation not completed."
   exit 1
fi

mkdir $v_home_lab/downloads
if ! [ $? -eq 0 ]; then
   echo "Folder structure creation not completed."
   exit 1
fi

export HOME_LAB=$v_home_lab
echo "Folder struture created."
