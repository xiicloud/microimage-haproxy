#!/bin/bash

set -e

export CON_NAME=haproxy_t
export REG_URL=index.csphere.cn
export IREG_URL=docker.nicescale.com:4443
export IMAGE=microimages/haproxy
export TAGS="1.8"
export BASE_IMAGE=microimages/alpine

docker pull $BASE_IMAGE

docker build -t $IMAGE .
./test.sh

docker tag -f $IMAGE $REG_URL/$IMAGE

for t in $TAGS; do
  docker tag -f $IMAGE $REG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IREG_URL/$IMAGE:$t
  docker tag -f $IMAGE $IMAGE:$t
done

docker push $REG_URL/$IMAGE
docker push $IREG_URL/$IMAGE

