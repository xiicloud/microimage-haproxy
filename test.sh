#!/bin/bash

set -xe

docker rm -f "$CON_NAME" > /dev/null 2>&1 || true
docker run -d --name $CON_NAME $IMAGE

sleep 5

docker exec $CON_NAME ps ax|grep "haprox[y]"
docker exec $CON_NAME ps ax|grep "conf[d]"
docker exec $CON_NAME wget -O - http://localhost/

docker rm -f $CON_NAME

echo "---> The test pass"
