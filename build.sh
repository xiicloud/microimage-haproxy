#!/bin/bash

set -e

export CON_NAME=haproxy_t
export REG_URL=d.nicescale.com:5000
export IMAGE=haproxy
export TAGS="1.5"
export BASE_IMAGE=microimages/alpine

docker pull $BASE_IMAGE

docker build -t microimages/$IMAGE .

#./test.sh

for t in $TAGS; do
  docker tag -f microimages/$IMAGE microimages/$IMAGE:$t
done

docker push microimages/$IMAGE
