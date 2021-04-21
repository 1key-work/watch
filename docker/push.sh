#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")"; pwd)
cd $DIR

source ./build.sh

echo $DOCKER_PASSWORD|docker login --password-stdin -u=$DOCKER_USER $DOCKER_HOST

docker push $NAME

for t in latest $DATE; do
  docker push "$NAME:${t}"
done
