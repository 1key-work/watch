#!/usr/bin/env bash

set -ex
DIR=$(cd "$(dirname "$0")/.."; pwd)
cd $DIR

NAME=$(basename $DIR)

docker build -t $NAME .
