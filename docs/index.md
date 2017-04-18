# Getting Started

Docker4WordPress is a set of docker containers optimized for WordPress. Use docker-compose.yml file from [docker4wordpress repository](https://github.com/wodby/docker4wordpress) to spin up local environment on Linux, Mac OS X and Windows. 

Docker4WordPress is designed to be used for local development, if you're looking for a dev/staging/production solution consistent with Docker4WordPress check out [Wodby](https://wodby.com). 

## Overview

The WordPress bundle consist of the following containers:

[wodby/wordpress-nginx]: https://github.com/wodby/wordpress-nginx
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/redis]: https://github.com/wodby/redis
[wodby/wordpress-varnish]: https://github.com/wodby/wordpress-varnish
[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[mailhog/mailhog]: https://hub.docker.com/r/mailhog/mailhog
[_/traefik]: https://hub.docker.com/_/traefik

| Container | Versions | Service name | Image | Enabled by default |
| --------- | -------- | ------------ | ----- | ------------------ |
| [Nginx](containers/nginx.md)         | 1.10     | nginx     | [wodby/wordpress-nginx]   | ✓ |
| [PHP](containers/php.md)             | 7.0, 7.1 | php       | [wodby/wordpress-php]     | ✓ |
| [MariaDB](containers/mariadb.md)     | 10.1     | mariadb   | [wodby/mariadb]           | ✓ |
| [Redis](containers/redis.md)         | 3.2      | redis     | [wodby/redis]             |   |
| [Varnish](containers/varnish.md)     | 4.1      | varnish   | [wodby/wordpress-varnish] |   |
| phpMyAdmin                           | latest   | pma       | [phpmyadmin/phpmyadmin]   |   |
| Mailhog                              | latest   | mailhog   | [mailhog/mailhog]         | ✓ |
| Traefik                              | latest   | traefik   | [_/traefik]               |   |

Supported WordPress versions: 4

## Requirements

* Install Docker ([Linux](https://docs.docker.com/engine/installation), [Docker for Mac](https://docs.docker.com/engine/installation/mac) or [Docker for Windows (10+ Pro)](https://docs.docker.com/engine/installation/windows))
* For Linux additionally install [docker compose](https://docs.docker.com/compose/install)

## Must know before you start

1. To make sure you don't lose your MariaDB data DO NOT use `docker-compose down` (Docker will destroy volumes), instead use `docker-compose stop`. Alternatively, you can specify manual volume for `/var/lib/mysql` (see compose file), this way your data will always persist 
2. To avoid potential problems with permissions between your host and containers please follow [this instructions](permissions.md)
3. _For macOS users_: Out of box Docker for Mac has [poor performance](https://github.com/Wodby/docker4wordpress/issues/4) on macOS. However there's a workaround based on [docker-sync project](https://github.com/EugenMayer/docker-sync/), read instructions [here](macos.md)

## Usage 

There 2 options how to use docker4wordpress – you can either run [vanilla](https://en.wikipedia.org/wiki/Vanilla_software) WordPress from the image or mount your own WordPress codebase:

### 1. Run Vanilla WordPress from Image (default)

1. Download [docker-compose.yml file](https://github.com/wodby/docker4wordpress/blob/master/docker-compose.yml)
2. Run containers: `docker-compose up -d` 
3. Wait a few seconds for containers initialization 
4. That's it! Proceed with WordPress installation at [http://wp.docker.localhost:8000](http://wp.docker.localhost:8000). Default database user, password and database name are all `wordpress`, database host is `mariadb`

### 2. Mount my WordPress Codebase

0. Read [must know before you start](#must-know-before-you-start)
1. Download [docker-compose.yml file](https://github.com/wodby/docker4wordpress/blob/master/docker-compose.yml) to your WordPress project root
2. Replace php image from `wodby/wordpress` (PHP + vanilla WordPress) to `wodby/wordpress-php` (just PHP)
3. Update _nginx_ and _php_ volumes to `- ./:/var/www/html` to mount your codebase
4. Ensure your wp-config.php has the same credentials as _mariadb_ service 
5. Optional: [import existing database](containers/mariadb.md#import-existing-database)
7. Optional: uncomment lines in the compose file to run _redis_, _varnish_, _phpmyadmin (pma)_ 
8. Optional: [customize domains](domains.md)
9. Run containers: `docker-compose up -d`
10. That's it! Your WordPress website should be up and running at [http://wp.docker.localhost:8000](http://wp.docker.localhost:8000). If you need to run multiple projects simultaneously see [this article](multiple-projects.md)

## Usage 

Feel free to adjust volumes and ports in the compose file for your convenience.

1. Download [docker-compose.yml file](https://github.com/wodby/docker4wordpress/blob/master/docker-compose.yml) from [docker4wordpress repository](https://github.com/wodby/docker4wordpress) and put it to your WordPress project codebase directory. This directory will be mounted to PHP and Nginx containers 
2. Choose your PHP version (7.0 by default)
3. Make sure you have the same database credentials in your wp-config.php file and MariaDB service definition in the compose file 
4. Optional: [import existing database](containers/mariadb.md#import-existing-database)
6. Optionally enable Varnish container by uncommenting the corresponding lines in the compose file
7. Optional: [configure domains](domains.md)
8. Run containers: `docker-compose up -d`
9. That's it! You WordPress website should be up and running at [http://wp.docker.localhost:8000](http://wp.docker.localhost:8000)

You can stop containers by executing:
```bash
docker-compose stop
```

Also, read [how to access containers](access.md) and [how to get logs](logs.md)

## Status

We're actively working on this instructions and containers. More options will be added soon. If you have a feature request or found a bug please [submit an issue on GitHub](https://github.com/wodby/docker4wordpress/issues/new) or [![Wodby Slack](https://www.google.com/s2/favicons?domain=www.slack.com) join us on Slack](https://slack.wodby.com/)

We update containers from time to time by releasing new images tags.

## License

This project is licensed under the MIT open source license.
