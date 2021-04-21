FROM node:15-alpine3.10

WORKDIR /
COPY docker/docker-alpine-cleanup.sh .
COPY lib/ /site
COPY package.json \
  .direnv/bin/mnode \
  .direnv/bin/node.mjs \
  .direnv/bin/loader.mjs /

RUN \
yarn config set registry https://registry.npm.taobao.org/ &&\
sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories &&\
yarn install --ignore-scripts && /docker-alpine-cleanup.sh

ENTRYPOINT ["/mnode","/site/koa.js"]

