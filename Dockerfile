FROM node:15-alpine3.10

WORKDIR /
COPY docker/docker-alpine-cleanup.sh .
COPY src/ /src
COPY package.json .direnv/bin/mnode .direnv/bin/node.mjs .direnv/bin/loader.mjs /

RUN \
yarn &&\
rm -rf /src &&\
/docker-alpine-cleanup.sh

ENTRYPOINT ["/mnode","/lib/koa.js"]
