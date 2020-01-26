FROM php:7.4.2-cli-alpine3.11

RUN apk --update --no-cache add bash python py-pip git nodejs nodejs-npm yarn zip \
    && pip install --no-cache-dir awscli setuptools \
    && pip install awsebcli --upgrade \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
    && docker-php-ext-install pdo_mysql bcmath \
    && rm -rf /var/cache/apk/* /root/.cache/pip/*

WORKDIR /root
VOLUME /root/.aws

ENTRYPOINT [ "bash" ]
