#!/bin/bash
read -p "Please confirm by pushing [Y] button to start downloading OpenJDK versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy] ]]; then 
   core/jdk/openjdk/download/run.sh 
else 
   echo "Skipping downloading OpenJDK versions."
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading maven versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/maven/download/run.sh
else
   echo "Skipping downloading maven versions."
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading vscode: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/vscode/download/run.sh
else
   echo "Skipping downloading vscode."
fi
echo