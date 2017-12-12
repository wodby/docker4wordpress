# Getting Started

Docker4WordPress is a set of docker containers optimized for WordPress. Use docker-compose.yml file from [docker4wordpress repository](https://github.com/wodby/docker4wordpress) to spin up local environment on Linux, Mac OS X and Windows. 

Docker4WordPress is designed to be used for local development, if you're looking for a production solution see [using in production](production.md). 

## Overview

The WordPress stack consist of the following containers:

[wodby/wordpress-nginx]: https://github.com/wodby/wordpress-nginx
[wodby/php-apache]: https://github.com/wodby/php-apache
[wodby/wordpress]: https://github.com/wodby/wordpress
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/postgres]: https://github.com/wodby/postgres
[wodby/redis]: https://github.com/wodby/redis
[wodby/wordpress-varnish]: https://github.com/wodby/wordpress-varnish
[wodby/webgrind]: https://hub.docker.com/r/wodby/webgrind
[blackfire/blackfire]: https://hub.docker.com/r/blackfire/blackfire
[arachnysdocker/athenapdf-service]: https://hub.docker.com/r/arachnysdocker/athenapdf-service
[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[mailhog/mailhog]: https://hub.docker.com/r/mailhog/mailhog
[portainer/portainer]: https://hub.docker.com/r/portainer/portainer
[_/traefik]: https://hub.docker.com/_/traefik
[Nginx]: containers/nginx.md
[Apache]: containers/apache.md
[PHP]: containers/php.md
[MariaDB]: containers/mariadb.md
[Redis]: containers/redis.md
[Varnish]: containers/varnish.md
[Webgrind]: containers/webgrind.md
[Blackfire]: containers/blackfire.md
[AthenaPDF]: containers/athenapdf.md

| Container    | Versions   | Service name | Image                              | Enabled by default |
| ------------ | ---------- | ------------ | ---------------------------------- | ------------------ |
| [Nginx]      | 1.13, 1.12 | `nginx`      | [wodby/wordpress-nginx]            | ✓                  |
| [Apache]     | 2.4        | `apache`     | [wodby/php-apache]                 |                    |
| WordPress    | 4          | `php`        | [wodby/wordpress]                  | ✓                  |
| [PHP]        | 7.x, 5.6   | `php`        | [wodby/wordpress-php]              |                    |
| [MariaDB]    | 10.2, 10.1 | `mariadb`    | [wodby/mariadb]                    | ✓                  |
| [PostgreSQL] | 10.1, 9.6  | `postgres`   | [wodby/postgres]                   |                    |
| [Redis]      | 4.0, 3.2   | `redis`      | [wodby/redis]                      |                    |
| [Varnish]    | 4.1        | `varnish`    | [wodby/wordpress-varnish]          |                    |
| [Webgrind]   | 1.5        | `webgrind`   | [wodby/webgrind]                   |                    |
| [Blackfire]  | latest     | `blackfire`  | [blackfire/blackfire]              |                    |
| [AthenaPDF]  | 2.10.0     | `athenapdf`  | [arachnysdocker/athenapdf-service] |                    |
| phpMyAdmin   | latest     | `pma`        | [phpmyadmin/phpmyadmin]            |                    |
| Mailhog      | latest     | `mailhog`    | [mailhog/mailhog]                  | ✓                  |
| Portainer    | latest     | `portainer`  | [portainer/portainer]              | ✓                  |
| Traefik      | latest     | `traefik`    | [_/traefik]                        | ✓                  |

Supported WordPress versions: 4

## Requirements

* Install Docker ([Linux](https://docs.docker.com/engine/installation), [Docker for Mac](https://docs.docker.com/engine/installation/mac) or [Docker for Windows (10+ Pro)](https://docs.docker.com/engine/installation/windows))
* For Linux additionally install [docker compose](https://docs.docker.com/compose/install)

## Must know before you start

1. To make sure you don't lose your MariaDB data DO NOT use `docker-compose down` (Docker will destroy volumes), instead use `docker-compose stop`. Alternatively, you can specify manual volume for `/var/lib/mysql` (see compose file), this way your data will always persist 
2. To avoid potential problems with permissions between your host and containers please follow [this instructions](permissions.md)
3. _For macOS users_: Out of box Docker for Mac has [poor performance](https://github.com/Wodby/docker4wordpress/issues/4) on macOS. However there's a workaround based on [docker-sync project](https://github.com/EugenMayer/docker-sync/), read instructions [here](macos.md)
4. For better reliability we release images with stability tags (e.g. `wodby/wordpress-php:7.1-X.X.X`) which correspond to git tags. We strongly recommend using images only with stability tags. 

## Usage 

There 2 options how to use docker4wordpress – you can either run [vanilla](https://en.wikipedia.org/wiki/Vanilla_software) WordPress from the image or mount your own WordPress codebase:

### 1. Run Vanilla WordPress from Image (default)

1. Download `docker-compose.yml` file from the [latest stable release](https://github.com/wodby/docker4wordpress/releases)
2. Run containers: `docker-compose up -d` (it may take some time for them to initialize) 
3. [Configure domains](domains.md) 
4. That's it! Proceed with WordPress installation at [http://wp.docker.localhost:8000](http://wp.docker.localhost:8000). Default database user, password and database name are all `wordpress`, database host is `mariadb`
5. You can see status of your containers and their logs via portainer: [http://portainer.wp.docker.localhost:8000](http://portainer.wp.docker.localhost:8000)

### 2. Mount my WordPress Codebase

0. Read [must know before you start](#must-know-before-you-start)
1. Download `docker-compose.yml` file from the [latest stable release](https://github.com/wodby/docker4wordpress/releases) to your WordPress project root
2. Replace php image from `wodby/wordpress` (PHP + vanilla WordPress) to `wodby/wordpress-php` (just PHP)
3. Update _nginx/apache_ and _php_ volumes to `- ./:/var/www/html` to mount your codebase
4. Ensure your wp-config.php has the same credentials as _mariadb_ service 
5. Optional: [import existing database](containers/mariadb.md#import-existing-database)
7. Optional: uncomment lines in the compose file to run _redis_, _varnish_, _phpmyadmin (pma)_ 
8. [Configure domains](domains.md)
9. Run containers: `docker-compose up -d`
10. That's it! Your WordPress website should be up and running at [http://wp.docker.localhost:8000](http://wp.docker.localhost:8000). If you need to run multiple projects simultaneously see [this article](multiple-projects.md)
11. You can see status of your containers and their logs via portainer: [http://portainer.wp.docker.localhost:8000](http://portainer.wp.docker.localhost:8000)

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
