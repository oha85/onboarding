#!/bin/bash

if [ -z $HOME_LAB ]; then
    echo "Please set HOME_LAB environment variable before running this script.";
    exit 1
fi

wget -P $HOME_LAB/downloads $1
