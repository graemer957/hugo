FROM ubuntu:18.04

LABEL maintainer="Graeme Read <graeme@sigma957.net>"
LABEL description="Hugo static site generator"

RUN apt-get -qq update && \
    apt-get -qq install -y --no-install-recommends wget ca-certificates && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV VERSION 0.62.2
ENV BINARY hugo_${VERSION}_Linux-64bit.deb

RUN wget https://github.com/spf13/hugo/releases/download/v${VERSION}/${BINARY} && \
         dpkg -i $BINARY && \
         rm -rf $BINARY
