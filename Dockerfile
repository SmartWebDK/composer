FROM composer

RUN rm -rf /tmp/cache

ENV PHP_DEPS="autoconf gcc make g++ zlib-dev"

RUN apk add --no-cache --update --virtual .build-deps ${PHP_DEPS} \
    && apk add --no-cache --update libmemcached-dev \
    && pecl install memcached \
    && docker-php-ext-enable memcached \
    && apk del .build-deps \
    && rm -rf /var/cache/apk/*

ADD docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh

ENTRYPOINT [ "/docker-entrypoint.sh" ]