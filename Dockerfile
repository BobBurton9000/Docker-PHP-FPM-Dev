FROM php:8.1-fpm
ARG USER_UID=1000
ARG GROUP_UID=1000

RUN curl https://getcomposer.org/download/2.5.4/composer.phar --output /usr/local/bin/composer
RUN chmod +x /usr/local/bin/composer

RUN curl -sSL https://github.com/mlocati/docker-php-extension-installer/releases/latest/download/install-php-extensions -o - | sh -s  \
    mcrypt \
    mysqli  \
    pgsql \
    pdo_pgsql \
    zip
RUN pecl install xdebug && docker-php-ext-enable xdebug

RUN usermod -u $USER_UID www-data
RUN groupmod -g $GROUP_UID www-data

COPY xdebug.ini /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini
RUN cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini

RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcs.phar
RUN curl -OL https://squizlabs.github.io/PHP_CodeSniffer/phpcbf.phar
RUN mv phpcs.phar /usr/local/bin/phpcs
RUN mv phpcbf.phar /usr/local/bin/phpcbf
RUN chmod +x /usr/local/bin/phpcs
RUN chmod +x /usr/local/bin/phpcbf