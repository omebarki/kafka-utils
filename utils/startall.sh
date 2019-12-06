#!/bin/bash

typeset CURRENT_DIR=$(dirname $0)

typeset BASE_DIR=$(cd ${CURRENT_DIR}/..; pwd)

sed -i ${BASE_DIR}/{config,utils}/*.properties  -e 's#/appli/tools/kafka_2.12-2.3.1#'${BASE_DIR}'#g'

nohup ${BASE_DIR}/bin/zookeeper-server-start.sh ${BASE_DIR}/config/zookeeper.properties 2>&1 >> ${BASE_DIR}/logs/nohup.log &

sleep 10

export JMX_PORT=9999
nohup ${BASE_DIR}/bin/kafka-server-start.sh ${BASE_DIR}/config/server.properties 2>&1 >> ${BASE_DIR}/logs/nohup.log &

echo
