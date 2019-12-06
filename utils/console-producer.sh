#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties

${CURRENT_DIR}/../bin/kafka-console-producer.sh --broker-list ${BROKER_HOST}:${BROKER_PORT} \
					--producer.config  ${CURRENT_DIR}/super_security.properties \
					$@
