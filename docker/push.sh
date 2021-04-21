#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

./docker/build.sh

NAME=$(basename $DIR)

docker push $DOCKER_HOST/$DOCKER_REPO/$NAME:latest
