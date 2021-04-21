#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)

PORT=$(echo -n $(cat src/config/port.txt))
docker run -it -p $PORT:$PORT --name $NAME --rm $NAME
