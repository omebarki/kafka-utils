#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties

${CURRENT_DIR}/../bin/kafka-console-consumer.sh --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} \
					--consumer.config  ${CURRENT_DIR}/super_security.properties \
					$@
