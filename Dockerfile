FROM ubuntu:16.04
MAINTAINER Massimo Scamarcia <massimo.scamarcia@gmail.com>

ENV LITECOIN_HOME /opt/litecoin
ENV LITECOIN_DATA /opt/litecoin/data
ENV LITECOIN_CONFIG ${LITECOIN_HOME}/litecoin.conf
ENV LITECOIN_VERSION=0.14.2

WORKDIR /root

RUN apt-get update
RUN apt-get install -y wget
RUN wget https://download.litecoin.org/litecoin-${LITECOIN_VERSION}/linux/litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz
RUN tar xvfz litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz
RUN mv litecoin-${LITECOIN_VERSION} ${LITECOIN_HOME}
RUN rm litecoin-${LITECOIN_VERSION}-x86_64-linux-gnu.tar.gz
RUN bash -c 'echo -e "datadir=${LITECOIN_DATA}" | tee ${LITECOIN_CONFIG}'

VOLUME ["${LITECOIN_DATA}"]

EXPOSE 9333 9332

WORKDIR ${LITECOIN_HOME}

CMD ${LITECOIN_HOME}/bin/litecoind --conf=${LITECOIN_CONFIG} --printtoconsole
