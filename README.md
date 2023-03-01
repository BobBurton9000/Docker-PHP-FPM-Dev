# PHP-FPM WITH CUSTOMISABLE UID FOR WWW-DATA USER
PHP-FPM image for local development that allows mapping the www-data user through arguments to avoid permission issues with locally mounted volumes.

**PHP Version 8.1**

Contains the following PHP extensions installed using [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer/)
- mcrypt
- mysqli
- pgsql
- pdo_pgsql
- zip

Contains the following extensions from PECL:
- xdebug

### Example usage in docker-compose:

```
  my-php-fpm:
    build:
      context: https://github.com/NumberAddict/Docker-PHP-FPM-Dev.git
      args:
        - USER_UID=1000
        - GROUP_UID=1000
    extra_hosts:
      - 'host.docker.internal:host-gateway'
    volumes:
      - ../:/var/www/html
```