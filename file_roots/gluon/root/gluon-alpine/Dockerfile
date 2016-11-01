FROM alpine:latest

MAINTAINER Svenja Dovnic <sdovnic@web.de>

# make dirclean
# time make GLUON_TARGET=ar71xx-generic V=s
# time make GLUON_TARGET=x86-generic V=s

#ENV GIT_SITE https://github.com/freifunk-herford/site-ffhf.git
ENV GIT_SITE https://le.basicartstudios.de/git/site-ffhf-dnn.git
#ENV GLUON_TARGET ar71xx-generic
ENV GLUON_TARGET x86-generic
ENV GLUON_BRANCH v2016.2
ENV GLUON_USER gluon

RUN \
apk update && \
apk add bash git wget subversion python perl grep alpine-sdk gawk unzip ncurses-dev zlib-dev openssl-dev && \
git clone -b ${GLUON_BRANCH} https://github.com/freifunk-gluon/gluon.git /gluon && \
git clone ${GIT_SITE} /gluon/site && \
mkdir /gluon/output && \
cd /gluon && \
make update

#RUN \
#    apt-get update -y && \
#    apt-get install -y git wget subversion python build-essential gawk unzip libncurses-dev libz-dev libssl-dev && \
#    git clone -b ${GLUON_BRANCH} https://github.com/freifunk-gluon/gluon.git /gluon && \
#    git clone ${GIT_SITE} /gluon/site && \
#    mkdir /gluon/output && \
#    cd /gluon && \
#    make update

WORKDIR /gluon

CMD /bin/bash

