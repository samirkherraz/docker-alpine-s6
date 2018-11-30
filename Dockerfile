FROM alpine:latest
ARG S6_OVERLAY_VERSION=v1.21.7.0


RUN set -x \
    && wget https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz \
    && tar xfz s6-overlay-amd64.tar.gz -C / \
    && rm s6-overlay-amd64.tar.gz 

ADD conf/ /

RUN set -x \
    && chmod +x /usr/bin/service-handler \
    && chmod +x /etc/cont-init.d/ -R \
    && chmod +x /etc/periodic/ -R  \
    && chmod +x /etc/s6/services/ -R 

ENTRYPOINT ["/init"]