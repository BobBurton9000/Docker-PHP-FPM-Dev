# DO NOT USE THIS IN PRODUCTION
This image runs PHP-FPM as root to avoid permission problems caused with WSL. If UID mapping is more suitable for your use, look at the master branch.

**PHP Version 8.1**

Contains the following PHP extensions installed using [mlocati/docker-php-extension-installer](https://github.com/mlocati/docker-php-extension-installer/)
- mcrypt
- mysqli
- pgsql
- pdo_pgsql
- zip

Contains the following extensions from PECL:
- xdebug