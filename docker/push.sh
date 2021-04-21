#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")"; pwd)
cd $DIR

docker login -u=$DOCKER_USER -p=$DOCKER_PASSWORD $DOCKER_HOST
