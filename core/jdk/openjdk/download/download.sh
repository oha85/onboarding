#!/bin/bash

_run() {
    core/jdk/openjdk/download/8-472-b0.sh
    core/jdk/openjdk/download/11-030-7.sh
    core/jdk/openjdk/download/17-018-8.sh
    core/jdk/openjdk/download/21-010-7.sh
    core/jdk/openjdk/download/25-02-10.sh
}
downloadOpenJDK (){
    read -p "Please confirm by pushing [Y] button to start downloading OpenJDK versions: " -n 1 -r
    echo
    if [[ $REPLY =~ ^[Yy] ]]; then
        _run
    else 
        echo "Skipping downloading OpenJDK versions."
    fi
}
