#!/bin/bash -x

mkdir log
mkdir data

export LOG_DIR=$PWD/log
export DATA_DIR=$PWD/data

for tarfile in `ls *.tar.gz`; do tar xzf $tarfile; rm $tarfile; done

export JAVA_HOME=$PWD/$(ls | grep jdk)
export ES_HOME=$PWD/$(ls | grep elasticsearch)

$ES_HOME/bin/elasticsearch -E 'http.port=8080' -E 'network.host=0.0.0.0' -E 'discovery.type=single-node' 
