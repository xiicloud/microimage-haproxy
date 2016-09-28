#!/bin/bash

set -e

export CON_NAME=haproxy_t
export REG_URL=index.csphere.cn
export IMAGE=microimages/haproxy
export TAGS="1.6-https 1.6.6-https"
export BASE_IMAGE=microimages/alpine

docker pull $BASE_IMAGE

docker build -t $IMAGE .
./test.sh

docker tag -f $IMAGE $REG_URL/$IMAGE

for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $IMAGE
docker push $REG_URL/$IMAGE

