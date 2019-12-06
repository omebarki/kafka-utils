#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties

${CURRENT_DIR}/../bin//kafka-consumer-groups.sh --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} \
					 \
					--list --all-groups 
