#!/bin/bash

read -p "Please confirm by pushing [Y] button to start downloading OpenJDK versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy] ]]; then 
   ./jdk/openjdk/run.sh 
fi
echo

read -p "Please confirm by pushing [Y] button to start downloading maven versions:" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   ./maven/run.sh
fi
echo

read -p "Please confirm by pushing [Y] button to start downloading vscode" -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   ./vscode/run.sh
fi
echo
