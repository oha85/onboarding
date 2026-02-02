#!/bin/bash

#Last git version was 2.43.0 
sudo apt-get remove --auto-remove git
sudo apt-get purge --auto-remove git
sudo apt install git
git --version
read -p "Press key to continue..." -n1 -s

#Last vsCode version was 1.108.2
sudo apt-get remove --auto-remove code 
sudo apt-get purge --auto-remove code 
sudo snap install --classic code
code --version
read -p "Press key to continue..." -n1 -s
 
