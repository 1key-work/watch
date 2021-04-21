#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")"; pwd)
cd $DIR

./build.sh

echo $DOCKER_PASSWORD|docker login --password-stdin -u=$DOCKER_USER $DOCKER_HOST

docker push $NAME

for t in latest $DATE; do
  docker push "$NAME:$t"
done

