FROM ubuntu:16.04

MAINTAINER Svenja Dovnic <sdovnic@web.de>

RUN \
    apt update -y && \
    apt install -y bash git wget subversion python build-essential gawk unzip libncurses-dev libz-dev libssl-dev && \
    apt install -y git npm ruby-sass

CMD /bin/bash
