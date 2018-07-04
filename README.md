# Docker-based WordPress Stack

[![Build Status](https://travis-ci.org/wodby/docker4wordpress.svg?branch=master)](https://travis-ci.org/wodby/docker4wordpress)
[![Wodby Slack](http://slack.wodby.com/badge.svg)](http://slack.wodby.com)
[![Wodby Twitter](https://img.shields.io/twitter/follow/wodbyhq.svg?style=social&label=Follow)](https://twitter.com/wodbyhq)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use docker-compose.yml file from this repository to spin up a local environment for WordPress on Linux, macOS and Windows. 

Read [**Quick Start**](https://wodby.com/stacks/wordpress/docs/local/quick-start/).

## Stack

The WordPress stack consist of the following containers:

| Container     | Versions           | Service name    | Image                              | Default |
| ------------- | ------------------ | ------------    | ---------------------------------- | ------- |
| [Nginx]       | 1.15, 1.14, 1.13   | `nginx`         | [wodby/wordpress-nginx]            | ✓       |
| [Apache]      | 2.4                | `apache`        | [wodby/php-apache]                 |         |
| [WordPress]   | 4                  | `php`           | [wodby/wordpress]                  | ✓       |
| [PHP]         | 7.x, 5.6           | `php`           | [wodby/wordpress-php]              |         |
| [MariaDB]     | 10.3, 10.2, 10.1   | `mariadb`       | [wodby/mariadb]                    | ✓       |
| [PostgreSQL]  | 10, 9.x            | `postgres`      | [wodby/postgres]                   |         |
| [Redis]       | 4.0, 3.2           | `redis`         | [wodby/redis]                      |         |
| [Varnish]     | 4.1                | `varnish`       | [wodby/wordpress-varnish]          |         |
| [Node.js]     | 9.11, 8.11, 6.14   | `node`          | [wodby/node]                       |         |
| [Solr]        | 7.x, 6.6, 5.5, 5.4 | `solr`          | [wodby/solr]                       |         |
| Elasticsearch | 6.x, 5.6, 5.5, 5.4 | `elasticsearch` | [wodby/elasticsearch]              |         |
| Kibana        | 6.x, 5.6, 5.5, 5.4 | `kibana`        | [wodby/kibana]                     |         |
| [Memcached]   | 1.5                | `memcached`     | [wodby/memcached]                  |         |
| [AthenaPDF]   | 2.10.0             | `athenapdf`     | [arachnysdocker/athenapdf-service] |         |
| [Webgrind]    | 1.5                | `webgrind`      | [wodby/webgrind]                   |         |
| [Blackfire]   | latest             | `blackfire`     | [blackfire/blackfire]              |         |
| [Mailhog]     | latest             | `mailhog`       | [mailhog/mailhog]                  | ✓       |
| [OpenSMTPD]   | 6.0                | `opensmtpd`     | [wodby/opensmtpd]                  |         |
| [Rsyslog]     | latest             | `rsyslog`       | [wodby/rsyslog]                    |         |
| Adminer       | 4.6                | `pma`           | [wodby/adminer]                    |         |
| phpMyAdmin    | latest             | `pma`           | [phpmyadmin/phpmyadmin]            |         |
| Portainer     | latest             | `portainer`     | [portainer/portainer]              | ✓       |
| Traefik       | latest             | `traefik`       | [_/traefik]                        | ✓       |

Supported WordPress versions: 4

## Documentation

Full documentation is available at https://wodby.com/stacks/wordpress/docs/local

## Deployment

Deploy docker-based WordPress stack with orchestrations to your own server via [![Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://cloud.wodby.com/stackhub/a54a0f59-f4fd-49af-ad16-8d9ff776c50e).

## License

This project is licensed under the MIT open source license.

[Apache]: https://wodby.com/stacks/wordpress/docs/containers/apache
[AthenaPDF]: https://wodby.com/stacks/wordpress/docs/containers/athenapdf
[Blackfire]: https://wodby.com/stacks/wordpress/docs/containers/blackfire
[Mailhog]: https://wodby.com/stacks/wordpress/docs/containers/mailhog
[MariaDB]: https://wodby.com/stacks/wordpress/docs/containers/mariadb
[Memcached]: https://wodby.com/stacks/wordpress/docs/containers/memcached
[Nginx]: https://wodby.com/stacks/wordpress/docs/containers/nginx
[Node.js]: https://wodby.com/stacks/wordpress/docs/containers/node
[OpenSMTPD]: https://wodby.com/stacks/wordpress/docs/containers/opensmtpd
[PHP]: https://wodby.com/stacks/wordpress/docs/containers/php
[PostgreSQL]: https://wodby.com/stacks/wordpress/docs/containers/postgres
[Redis]: https://wodby.com/stacks/wordpress/docs/containers/redis
[Rsyslog]: https://wodby.com/stacks/wordpress/docs/containers/rsyslog
[Solr]: https://wodby.com/stacks/wordpress/docs/containers/solr
[Varnish]: https://wodby.com/stacks/wordpress/docs/containers/varnish
[Webgrind]: https://wodby.com/stacks/wordpress/docs/containers/webgrind
[Wordpress]: https://wodby.com/stacks/wordpress/docs/containers/php

[_/traefik]: https://hub.docker.com/_/traefik
[arachnysdocker/athenapdf-service]: https://hub.docker.com/r/arachnysdocker/athenapdf-service
[blackfire/blackfire]: https://hub.docker.com/r/blackfire/blackfire
[mailhog/mailhog]: https://hub.docker.com/r/mailhog/mailhog
[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[portainer/portainer]: https://hub.docker.com/r/portainer/portainer
[wodby/adminer]: https://github.com/wodby/adminer
[wodby/elasticsearch]: https://github.com/wodby/elasticsearch
[wodby/kibana]: https://github.com/wodby/kibana
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/memcached]: https://github.com/wodby/memcached
[wodby/node]: https://github.com/wodby/node
[wodby/opensmtpd]: https://github.com/wodby/opensmtpd
[wodby/php-apache]: https://github.com/wodby/php-apache
[wodby/postgres]: https://github.com/wodby/postgres
[wodby/redis]: https://github.com/wodby/redis
[wodby/rsyslog]: https://github.com/wodby/rsyslog
[wodby/solr]: https://github.com/wodby/solr
[wodby/webgrind]: https://hub.docker.com/r/wodby/webgrind
[wodby/wordpress-nginx]: https://github.com/wodby/wordpress-nginx
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/wordpress-varnish]: https://github.com/wodby/wordpress-varnish
[wodby/wordpress]: https://github.com/wodby/wordpress
