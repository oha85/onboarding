#!/bin/bash
read -p "Please confirm by pushing [Y] button to start downloading OpenJDK versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy] ]]; then 
   core/jdk/openjdk/run.sh 
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading maven versions: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/maven/run.sh
fi
echo
read -p "Please confirm by pushing [Y] button to start downloading vscode: " -n 1 -r
if [[ $REPLY =~ ^[Yy]$ ]]; then
   core/vscode/run.sh
fi
echo