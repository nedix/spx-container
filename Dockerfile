ARG PHP_VERSION=8.2
ARG SPX_VERSION=v0.4.14

FROM --platform=$BUILDPLATFORM wodby/php:${PHP_VERSION}-dev

ARG SPX_VERSION

USER root

RUN apk add --virtual .build-deps \
        autoconf \
        build-base \
        git \
        zlib-dev \
    && git clone https://github.com/NoiseByNorthwest/php-spx.git /build \
    && cd /build \
    && git checkout tags/${SPX_VERSION} \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && rm -rf /build \
    && apk del .build-deps

ADD rootfs /

EXPOSE 9000
