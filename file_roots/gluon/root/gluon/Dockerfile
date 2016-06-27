FROM ubuntu:16.04

MAINTAINER Svenja Dovnic <sdovnic@web.de>

# make dirclean
# time make GLUON_TARGET=ar71xx-generic V=s
# time make GLUON_TARGET=x86-generic V=s

#ENV GIT_SITE https://github.com/freifunk-herford/site-ffhf.git
ENV GIT_SITE https://le.basicartstudios.de/git/site-ffhf-dnn.git
#ENV GLUON_TARGET ar71xx-generic
ENV GLUON_TARGET x86-generic
ENV GLUON_BRANCH v2016.1.5
ENV GLUON_USER gluon

RUN apt-get update -y
RUN apt-get install -y git subversion python build-essential gawk unzip libncurses-dev libz-dev libssl-dev
RUN useradd -m -s /bin/bash ${GLUON_USER}

USER ${GLUON_USER}

WORKDIR /home/${GLUON_USER}

RUN git clone -b ${GLUON_BRANCH} https://github.com/freifunk-gluon/gluon.git /home/${GLUON_USER}/gluon
RUN git clone ${GIT_SITE} /home/${GLUON_USER}/gluon/site

WORKDIR /home/${GLUON_USER}/gluon

RUN mkdir output

RUN make update

CMD /bin/bash
