#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)

DOCKER_NAME=$DOCKER_PUSH/$DOCKER_REPO/$NAME:`date +"%Y-%m-%d"`
docker tag $NAME $DOCKER_NAME
docker push $DOCKER_NAME
