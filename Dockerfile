FROM php:7.4.15-cli-alpine3.13

RUN apk --update --no-cache add gcc musl-dev python3-dev libffi-dev openssl-dev cargo build-base bash python3 py3-pip git nodejs nodejs-npm yarn zip \
    && pip3 install --no-cache-dir awscli setuptools setuptools-rust \
    && pip3 install wheel awsebcli --upgrade \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo_mysql bcmath \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "/bin/sh" ]
