#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)
DATE=$(date +"%Y-%m-%d")

yarn

docker build -t $NAME -t $NAME:latest -t $NAME:$DATE .
