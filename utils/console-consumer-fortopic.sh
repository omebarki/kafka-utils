#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
typeset KAFKA_CONSUMER_CONSOLE_CMD=${CURRENT_DIR}/../bin/kafka-console-consumer.sh
typeset KAFKA_CLIENT_CONFIG_FILE=${CURRENT_DIR}/super_security.properties

. ${CURRENT_DIR}/kafka_config.properties


usage(){
	echo $0 topic consumer_group login password
}

if [[ $# < 4 ]]; then
	usage
	exit 1
fi

typeset LOGIN=$3
typeset PASSWORD=$4

cat ${KAFKA_CLIENT_CONFIG_FILE} | sed  -e 's/username=\\".*\\"/username=\\"'${LOGIN}'\\"/' -e 's/password=\\".*\\"/password=\\"'${PASSWORD}'\\"/' > ${KAFKA_CLIENT_CONFIG_FILE}.tmp 

${KAFKA_CONSUMER_CONSOLE_CMD} --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} \
					--consumer.config   ${KAFKA_CLIENT_CONFIG_FILE}.tmp\
					--topic $1 --group $2
