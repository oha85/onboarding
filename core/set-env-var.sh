#!/bin/bash

export MEDIA_DATA_DIR=/home/oualaa/media/DATA
export MEDIA_DATA_DIR_DEV=$MEDIA_DATA_DIR/ubuntu/dev

export JAVA_HOME_8=$MEDIA_DATA_DIR_DEV/jdk/OpenJDK/8_472-b08
export JAVA_HOME_11=$MEDIA_DATA_DIR_DEV/jdk/OpenJDK/11.0.29_7
export JAVA_HOME_17=$MEDIA_DATA_DIR_DEV/jdk/OpenJDK/17.0.18_8
export JAVA_HOME_21=$MEDIA_DATA_DIR_DEV/jdk/OpenJDK/21.0.10_7
export JAVA_HOME_25=$MEDIA_DATA_DIR_DEV/jdk/OpenJDK/25.0.2_10
export JAVA_HOME=$JAVA_HOME_25

export MAVEN_HOME_3912=$MEDIA_DATA_DIR_DEV/maven/3.9.12
export MAVEN_HOME=$MAVEN_HOME_3912

export GITLAB_HOME=$MEDIA_DATA_DIR_DEV/gitlab

export PATH=$PATH:$JAVA_HOME/bin:$MAVEN_HOME/bin

lss() {
ls -a --group-directories-first
}

lls() {
ls -la --group-directories-first
}
