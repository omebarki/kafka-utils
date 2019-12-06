#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties

${CURRENT_DIR}/../bin/kafka-streams-application-reset.sh --bootstrap-servers ${BROKER_HOST}:${BROKER_PORT} \
					--config-file ${CURRENT_DIR}/super_security.properties \
					--input-topics $1 --application-id $2 --to-earliest
