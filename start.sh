#!/bin/bash -x

mkdir log
mkdir data

export LOG_DIR=$PWD/log
export DATA_DIR=$PWD/data
export JAVA_HOME=$PWD/jre1.8.0_191
export ES_HOME=$PWD/elasticsearch-6.4.3

$ES_HOME/bin/elasticsearch -E 'http.port=8080' -E 'network.host=0.0.0.0' -E 'discovery.type=single-node' 
