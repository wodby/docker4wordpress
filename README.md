# Docker-based WordPress Stack

[![Build Status](https://travis-ci.org/wodby/docker4wordpress.svg?branch=master)](https://travis-ci.org/wodby/docker4wordpress)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)
[![Wodby Twitter](https://img.shields.io/twitter/follow/wodbyhq.svg?style=social&label=Follow)](https://twitter.com/wodbyhq)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use docker-compose.yml file from this repository to spin up a local environment for WordPress on Linux, macOS and Windows. 

Read [**Quick Start**](https://wodby.com/stacks/wordpress/docs/local/quick-start/).

## Stack

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

The WordPress stack consist of the following containers:

| Container  | Versions   | Service name | Image                              | Enabled by default |
| ---------- | ---------- | ------------ | ---------------------------------- | ------------------ |
| Nginx      | 1.13, 1.12 | `nginx`      | [wodby/wordpress-nginx]            | ✓                  |
| Apache     | 2.4        | `apache`     | [wodby/php-apache]                 |                    |
| WordPress  | 4          | `php`        | [wodby/wordpress]                  | ✓                  |
| PHP        | 7.x, 5.6   | `php`        | [wodby/wordpress-php]              |                    |
| MariaDB    | 10.2, 10.1 | `mariadb`    | [wodby/mariadb]                    | ✓                  |
| PostgreSQL | 10.1, 9.6  | `postgres`   | [wodby/postgres]                   |                    |
| Redis      | 4.0, 3.2   | `redis`      | [wodby/redis]                      |                    |
| Varnish    | 4.1        | `varnish`    | [wodby/wordpress-varnish]          |                    |
| AthenaPDF  | 2.10.0     | `athenapdf`  | [arachnysdocker/athenapdf-service] |                    |
| Webgrind   | 1.5        | `webgrind`   | [wodby/webgrind]                   |                    |
| Blackfire  | latest     | `blackfire`  | [blackfire/blackfire]              |                    |
| phpMyAdmin | latest     | `pma`        | [phpmyadmin/phpmyadmin]            |                    |
| Mailhog    | latest     | `mailhog`    | [mailhog/mailhog]                  | ✓                  |
| Portainer  | latest     | `portainer`  | [portainer/portainer]              | ✓                  |
| Traefik    | latest     | `traefik`    | [_/traefik]                        | ✓                  |

Supported WordPress versions: 4

## Documentation

Full documentation is available at https://wodby.com/stacks/wordpress/docs/local

## Deployment

Deploy docker-based WordPress stack with orchestrations to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://cloud.wodby.com/stackhub/a54a0f59-f4fd-49af-ad16-8d9ff776c50e).

## License

This project is licensed under the MIT open source license.
