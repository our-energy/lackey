FROM php:7.2-cli-alpine

RUN apk --update --no-cache add bash python py-pip git nodejs nodejs-npm yarn \
    && pip install --no-cache-dir awscli awsebcli \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo_mysql \
    && apk del py-pip \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "bash" ]
