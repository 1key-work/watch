#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)

push(){
DOCKER_NAME=$DOCKER_PUSH/$DOCKER_REPO/$NAME:$1
docker tag $NAME $DOCKER_NAME
docker push $DOCKER_NAME
}

push `date +"%Y-%m-%d"`
push latest
