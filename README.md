# Docker-based WordPress environment for local development

[![Documentation Status](https://readthedocs.org/projects/docker4wordpress/badge/?version=latest)](http://docs.docker4wordpress.org)
[![Build Status](https://travis-ci.org/wodby/docker4wordpress.svg?branch=master)](https://travis-ci.org/wodby/docker4wordpress)

[![Wodby Slack](https://www.google.com/s2/favicons?domain=www.slack.com) Get help on Slack](https://slack.wodby.com/)

[![Wodby Twitter](https://twitter.com/favicon.ico) Follow us on Twitter to stay up to date](https://twitter.com/wodbyhq)

## Introduction

Docker4WordPress is a set of docker images optimized for local development with WordPress. Use docker-compose.yml file from this repository to spin up local environment on Linux, Mac OS X and Windows. 

Read [**Getting Started**](http://docs.docker4wordpress.org/en/latest/).

## Bundle

[wodby/wordpress-nginx]: https://github.com/wodby/wordpress-nginx
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/redis]: https://github.com/wodby/redis
[wodby/wordpress-varnish]: https://github.com/wodby/wordpress-varnish
[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[mailhog/mailhog]: https://hub.docker.com/r/mailhog/mailhog
[_/traefik]: https://hub.docker.com/_/traefik

The WordPress bundle consist of the following containers:

| Container | Versions | Service name | Image | Enabled by default |
| --------- | -------- | ------------ | ----- | ------------------ |
| Nginx      | 1.10     | nginx     | [wodby/wordpress-nginx]   | ✓ |
| PHP        | 7.0, 7.1 | php       | [wodby/wordpress-php]     | ✓ |
| MariaDB    | 10.1     | mariadb   | [wodby/mariadb]           | ✓ |
| Redis      | 3.2      | redis     | [wodby/redis]             |   |
| Varnish    | 4.1      | varnish   | [wodby/wordpress-varnish] |   |
| phpMyAdmin | latest   | pma       | [phpmyadmin/phpmyadmin]   |   |
| Mailhog    | latest   | mailhog   | [mailhog/mailhog]         | ✓ |
| Traefik    | latest   | traefik   | [_/traefik]               |   |

Supported WordPress versions: 4

## Documentation

Full documentation is available at http://docs.docker4wordpress.org/.

## Using in Production

Deploy docker-based infrastructure for WordPress to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com).

## License

This project is licensed under the MIT open source license.
