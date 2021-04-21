#!/usr/bin/env bash

set -e
DIR=$(cd "$(dirname "$0")"; pwd)
cd $DIR

./build.sh

docker push $NAME

for t in latest $DATE; do
  docker push "$NAME:$t"
done

