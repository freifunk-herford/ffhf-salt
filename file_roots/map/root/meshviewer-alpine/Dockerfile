FROM alpine:latest

MAINTAINER Svenja Dovnic <sdovnic@web.de>

# node_modules/.bin/grunt

#ENV MESHVIEWER_GIT https://github.com/ffnord/meshviewer
ENV MESHVIEWER_GIT https://github.com/FreiFunkMuenster/meshviewer/
ENV MESHVIEWER_BRANCH plumpudding

#apk add bash git ?npm? nodejs ?nodejs-legacy? ?ruby-sass? && \

RUN \
apk update && \
apk add bash git nodejs && \
git clone -b ${MESHVIEWER_BRANCH} ${MESHVIEWER_GIT} /meshviewer &&  \
cd /meshviewer && \
mkdir build && \
npm install && \
npm install grunt-cli && \
npm install grunt-bower-install-simple

#RUN \
#    apt-get update -y &&  \
#    apt-get install -y git git npm nodejs-legacy ruby-sass &&  \
#    git clone -b ${MESHVIEWER_BRANCH} ${MESHVIEWER_GIT} /meshviewer &&  \
#    cd /meshviewer && \
#    mkdir build && \
#    npm install && \
#    npm install grunt-cli && \
#    npm install grunt-bower-install-simple

WORKDIR /meshviewer

CMD /bin/bash

