FROM wodby/php:8.1

USER root

RUN apk add --virtual .build-deps \
        autoconf \
        build-base \
        git \
        zlib-dev \
    && git clone https://github.com/NoiseByNorthwest/php-spx.git /tmp/spx \
    && cd /tmp/spx \
    && phpize \
    && ./configure \
    && make \
    && make install \
    && rm -rf /tmp/spx \
    && apk del .build-deps

ADD rootfs /

EXPOSE 9000
