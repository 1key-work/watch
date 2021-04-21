#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)
DATE=$(date +"%Y-%m-%d")

yarn

docker build -t $DOCKER_HOST/$DOCKER_REPO/$NAME:latest .
