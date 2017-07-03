# Docker-based WordPress Stack

[![Documentation Status](https://readthedocs.org/projects/docker4wordpress/badge/?version=latest)](http://docs.docker4wordpress.org)
[![Build Status](https://travis-ci.org/wodby/docker4wordpress.svg?branch=master)](https://travis-ci.org/wodby/docker4wordpress)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)
[![Wodby Twitter](https://img.shields.io/twitter/follow/wodbyhq.svg?style=social&label=Follow)](https://twitter.com/wodbyhq)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use docker-compose.yml file from this repository to WordPress stack on Linux, macOS and Windows. 

Read [**Getting Started**](http://docs.docker4wordpress.org/en/latest/).

## Stack

[wodby/wordpress-nginx]: https://github.com/wodby/wordpress-nginx
[wodby/wordpress-apache]: https://github.com/wodby/wordpress-apache
[wodby/wordpress]: https://github.com/wodby/wordpress
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/redis]: https://github.com/wodby/redis
[wodby/wordpress-varnish]: https://github.com/wodby/wordpress-varnish
[athenapdf-service]: https://hub.docker.com/r/arachnysdocker/athenapdf-service
[phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[mailhog]: https://hub.docker.com/r/mailhog/mailhog
[portainer]: https://hub.docker.com/r/portainer/portainer
[_/traefik]: https://hub.docker.com/_/traefik

The WordPress stack consist of the following containers:

| Container | Versions | Service name | Image | Enabled by default |
| --------- | -------- | ------------ | ----- | ------------------ |
| Nginx      | 1.13, 1.12 | nginx     | [wodby/wordpress-nginx]   | ✓ |
| Apache     | 2.4        | php       | [wodby/wordpress-apache]  |   |
| WordPress  | 4          | php       | [wodby/wordpress]         | ✓ |
| PHP        | 7.1, 7.0   | php       | [wodby/wordpress-php]     |   |
| MariaDB    | 10.1       | mariadb   | [wodby/mariadb]           | ✓ |
| Redis      | 3.2        | redis     | [wodby/redis]             |   |
| Varnish    | 4.1        | varnish   | [wodby/wordpress-varnish] |   |
| AthenaPDF  | latest     | athenapdf | [athenapdf-service]       |   |
| phpMyAdmin | latest     | pma       | [phpmyadmin]              |   |
| Mailhog    | latest     | mailhog   | [mailhog]                 | ✓ |
| Portainer  | latest     | portainer | [portainer]               | ✓ |
| Traefik    | latest     | traefik   | [_/traefik]               | ✓ |

Supported WordPress versions: 4

## Documentation

Full documentation is available at http://docs.docker4wordpress.org/.

## Deployment

Deploy docker-based WordPress stack to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://cloud.wodby.com/stackhub/dcca9437-eef2-4b3b-8ab2-b7c9c480a19e/detail).

## License

This project is licensed under the MIT open source license.
