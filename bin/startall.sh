#!/bin/bash

typeset CURRENT_DIR=$(dirname $0)

typeset BASE_DIR=$(cd ${CURRENT_DIR}/..; pwd)

sed -i ${CURRENT_DIR}/../{config,utils}/*.properties  -e 's#/appli/tools/kafka_2.12-2.3.1#'${BASE_DIR}'#g'

nohup ${CURRENT_DIR}/zookeeper-server-start.sh ${CURRENT_DIR}/../config/zookeeper.properties 2>&1 >> ${CURRENT_DIR}/../logs/nohup.log &

sleep 10

export JMX_PORT=9999
nohup ${CURRENT_DIR}/kafka-server-start.sh ${CURRENT_DIR}/../config/server.properties 2>&1 >> ${CURRENT_DIR}/../logs/nohup.log &

echo
