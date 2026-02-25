ARG PHP_VERSION=8.5
ARG SPX_VERSION=0.4.22

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
    && git checkout "tags/v${SPX_VERSION}" \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && rm -rf /build \
    && apk del .build-deps

ADD rootfs /

EXPOSE 9000
