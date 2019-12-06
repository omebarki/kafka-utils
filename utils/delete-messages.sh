#!/bin/bash
typeset CURRENT_DIR=$(dirname $0)
. ${CURRENT_DIR}/kafka_config.properties


JSON_CONTENT='{"partitions": ['
TOPIC_NAME=$1
PARTITIONS_COUNT=$(${CURRENT_DIR}/describe-topic.sh ${TOPIC_NAME}| grep 'Partition: [0-9]*' | wc -l)
OFFSET=-1
JSON_CONTENT=${JSON_CONTENT}'{"topic": "'${TOPIC_NAME}'","partition": 0,"offset": '${OFFSET}'}'
for (( COUNTER=1; COUNTER<${PARTITIONS_COUNT}; COUNTER++ ))
do
	JSON_CONTENT=${JSON_CONTENT}',{"topic": "'${TOPIC_NAME}'","partition": '${COUNTER}',"offset": '${OFFSET}'}'
done
JSON_CONTENT="${JSON_CONTENT}]}"

echo ${JSON_CONTENT} > /tmp/partitions.json




${CURRENT_DIR}/../bin/kafka-delete-records.sh --bootstrap-server ${BROKER_HOST}:${BROKER_PORT} \
					 \
					--offset-json-file /tmp/partitions.json
