#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

./docker/build.sh

NAME=$(basename $DIR)

docker push $NAME

for t in latest $DATE; do
  docker push "$NAME:$t"
done

