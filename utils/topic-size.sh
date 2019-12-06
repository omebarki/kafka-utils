#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties

${CURRENT_DIR}/../bin/kafka-log-dirs.sh --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} \
					 \
					--describe --topic-list $@
