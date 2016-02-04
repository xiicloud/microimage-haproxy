#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d -e APP=web -e SERVICE=service -e PUBLIC_DOMAIN=a.com -e HOST_IP=172.17.0.1 --name $CON_NAME $IMAGE

sleep 12

docker exec $CON_NAME ps ax|grep "conf[d]"

docker rm -f $CON_NAME

echo "---> The test pass"
