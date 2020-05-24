#!/bin/bash

CONTAINERS=$(docker ps | grep 9094 | awk '{print $1}')
BROKERS=$(for CONTAINER in ${CONTAINERS}; do docker port "$CONTAINER" 9094 | sed -e "s/0.0.0.0:/$HOST_IP:/g"; done)
echo "${BROKERS/$'\n'/,}"
