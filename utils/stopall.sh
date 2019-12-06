#!/bin/bash

typeset CURRENT_DIR=$(dirname $0)

typeset BASE_DIR=$(cd ${CURRENT_DIR}/..; pwd)



${CURRENT_DIR}/kafka-server-stop.sh 
sleep 2 
 ${CURRENT_DIR}/zookeeper-server-stop.sh
echo
