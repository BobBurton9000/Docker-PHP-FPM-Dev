FROM php:8.1-fpm
COPY php.ini /usr/local/etc/php/php.ini

ARG USER_UID=1000;
ARG GROUP_UID=1000;

RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s  \
    mcrypt \
    mysqli  \
    pgsql \
    pdo_pgsql \
    zip
RUN pecl install xdebug && docker-php-ext-enable xdebug
COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

RUN curl https://getcomposer.org/download/2.5.4/composer.phar --output /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer
RUN usermod -u ${USER_UID} www
RUN groupmod -g ${GROUP_UID} www

COPY zzz-docker.conf /usr/local/etc/php-fpm.d/zzz-docker.conf

CMD ["php-fpm", "-R"]