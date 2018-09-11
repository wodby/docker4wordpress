# Docker-based WordPress Stack

[![Build Status](https://travis-ci.org/wodby/docker4wordpress.svg?branch=master)](https://travis-ci.org/wodby/docker4wordpress)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use docker-compose.yml file from this repository to spin up a local environment for WordPress on Linux, macOS and Windows. 

* Read the docs on [**how to use**](https://wodby.com/docs/stacks/wordpress/local#usage)
* Follow [@wodbycloud](https://twitter.com/wodbycloud) for future announcements
* Join [community slack](https://slack.wodby.com) to ask questions

## Stack

The WordPress stack consist of the following containers:

| Container       | Versions           | Service name    | Image                              | Default |
| -------------   | ------------------ | ------------    | ---------------------------------- | ------- |
| [Nginx]         | 1.15, 1.14         | `nginx`         | [wodby/nginx]                      | ✓       |
| [Apache]        | 2.4                | `apache`        | [wodby/apache]                     |         |
| [WordPress]     | 4                  | `php`           | [wodby/wordpress]                  | ✓       |
| [PHP]           | 7.x, 5.6           | `php`           | [wodby/wordpress-php]              |         |
| [MariaDB]       | 10.3, 10.2, 10.1   | `mariadb`       | [wodby/mariadb]                    | ✓       |
| [PostgreSQL]    | 10, 9.x            | `postgres`      | [wodby/postgres]                   |         |
| [Redis]         | 4.0, 3.2           | `redis`         | [wodby/redis]                      |         |
| [Varnish]       | 4.1                | `varnish`       | [wodby/varnish]                    |         |
| [Node.js]       | 10.9, 8.11, 6.14   | `node`          | [wodby/node]                       |         |
| [Solr]          | 7.x, 6.6, 5.5      | `solr`          | [wodby/solr]                       |         |
| [Elasticsearch] | 6.x, 5.6, 5.5, 5.4 | `elasticsearch` | [wodby/elasticsearch]              |         |
| [Kibana]        | 6.x, 5.6, 5.5, 5.4 | `kibana`        | [wodby/kibana]                     |         |
| [Memcached]     | 1.5                | `memcached`     | [wodby/memcached]                  |         |
| [AthenaPDF]     | 2.10.0             | `athenapdf`     | [arachnysdocker/athenapdf-service] |         |
| [Webgrind]      | 1.5                | `webgrind`      | [wodby/webgrind]                   |         |
| [Blackfire]     | latest             | `blackfire`     | [blackfire/blackfire]              |         |
| [Mailhog]       | latest             | `mailhog`       | [mailhog/mailhog]                  | ✓       |
| [OpenSMTPD]     | 6.0                | `opensmtpd`     | [wodby/opensmtpd]                  |         |
| [Rsyslog]       | latest             | `rsyslog`       | [wodby/rsyslog]                    |         |
| Adminer         | 4.6                | `pma`           | [wodby/adminer]                    |         |
| phpMyAdmin      | latest             | `pma`           | [phpmyadmin/phpmyadmin]            |         |
| Portainer       | latest             | `portainer`     | [portainer/portainer]              | ✓       |
| Traefik         | latest             | `traefik`       | [_/traefik]                        | ✓       |

Supported WordPress versions: 4

## Documentation

Full documentation is available at https://wodby.com/docs/stacks/wordpress/local.

## Beyond local environment

Docker4WordPress is a project designed to help you spin up local environment with docker-compose. If you want to deploy a consistent stack with orchestrations to your own server, check out [![WordPress stack on Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com/stacks/wordpress).

## Maintenance

We regularly update images used in this stack and release them together, see [releases page](https://github.com/wodby/docker4wordpress/releases) for full changelog and update instructions.  

## License

This project is licensed under the MIT open source license.

[Apache]: https://wodby.com/docs/stacks/wordpress/containers#apache
[AthenaPDF]: https://wodby.com/docs/stacks/wordpress/containers#athenapdf
[Blackfire]: https://wodby.com/docs/stacks/wordpress/containers#blackfire
[Elasticsearch]: https://wodby.com/docs/stacks/wordpress/containers#elasticsearch
[Kibana]: https://wodby.com/docs/stacks/wordpress/containers#elasticsearch
[Mailhog]: https://wodby.com/docs/stacks/wordpress/containers#mailhog
[MariaDB]: https://wodby.com/docs/stacks/wordpress/containers#mariadb
[Memcached]: https://wodby.com/docs/stacks/wordpress/containers#memcached
[Nginx]: https://wodby.com/docs/stacks/wordpress/containers#nginx
[Node.js]: https://wodby.com/docs/stacks/wordpress/containers#nodejs
[OpenSMTPD]: https://wodby.com/docs/stacks/wordpress/containers#opensmtpd
[PHP]: https://wodby.com/docs/stacks/wordpress/containers#php
[PostgreSQL]: https://wodby.com/docs/stacks/wordpress/containers#postgresql
[Redis]: https://wodby.com/docs/stacks/wordpress/containers#redis
[Rsyslog]: https://wodby.com/docs/stacks/wordpress/containers#rsyslog
[Solr]: https://wodby.com/docs/stacks/wordpress/containers#solr
[Varnish]: https://wodby.com/docs/stacks/wordpress/containers#varnish
[Webgrind]: https://wodby.com/docs/stacks/wordpress/containers#webgrind
[Wordpress]: https://wodby.com/docs/stacks/wordpress/containers#php

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
[wodby/apache]: https://github.com/wodby/apache
[wodby/postgres]: https://github.com/wodby/postgres
[wodby/redis]: https://github.com/wodby/redis
[wodby/rsyslog]: https://github.com/wodby/rsyslog
[wodby/solr]: https://github.com/wodby/solr
[wodby/webgrind]: https://hub.docker.com/r/wodby/webgrind
[wodby/nginx]: https://github.com/wodby/nginx
[wodby/varnish]: https://github.com/wodby/varnish
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/wordpress]: https://github.com/wodby/wordpress
