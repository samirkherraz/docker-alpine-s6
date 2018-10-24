FROM alpine:latest
ARG S6_OVERLAY_VERSION=v1.21.7.0

RUN wget https://github.com/just-containers/s6-overlay/releases/download/${S6_OVERLAY_VERSION}/s6-overlay-amd64.tar.gz && \
    tar xfz s6-overlay-amd64.tar.gz -C / && \
    rm s6-overlay-amd64.tar.gz && \
    chmod -R u+x /etc/s6 && \
    chmod -R u+x /etc/cont-init.d

ENTRYPOINT ["/init"]