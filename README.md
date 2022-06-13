# Docker-based WordPress Stack

[![Build Status](https://github.com/wodby/docker4wordpress/workflows/Run%20tests/badge.svg)](https://github.com/wodby/docker4wordpress/actions)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use docker-compose.yml file from this repository to spin up a local environment for WordPress on Linux, macOS and Windows. 

* Read the docs on [**how to use**](https://wodby.com/docs/stacks/wordpress/local#usage)
* Ask questions on [Slack](http://slack.wodby.com/)
* Follow [@wodbycloud](https://twitter.com/wodbycloud) for future announcements

## Stack

The WordPress stack consist of the following containers:

| Container       | Versions         | Image                              | ARM64 support | Enabled by default |
|-----------------|------------------|------------------------------------|---------------|--------------------|
| [Nginx]         | 1.21, 1.20, 1.19 | [wodby/nginx]                      | ✓             | ✓                  |
| [Apache]        | 2.4              | [wodby/apache]                     | ✓             |                    |
| [WordPress]     | 6                | [wodby/wordpress]                  | ✓             | ✓                  |
| [PHP]           | 8.1, 8.0, 7.4    | [wodby/wordpress-php]              | ✓             |                    |
| Crond           |                  | [wodby/wordpress-php]              | ✓             | ✓                  |
| [MariaDB]       | 10.8-10.3        | [wodby/mariadb]                    | ✓             | ✓                  |
| [Redis]         | 7, 6, 5          | [wodby/redis]                      | ✓             |                    |
| [Memcached]     | 1                | [wodby/memcached]                  |               |                    |
| [Varnish]       | 6.0, 4.1         | [wodby/varnish]                    |               |                    |
| [Node.js]       | 16, 14, 12       | [wodby/node]                       |               |                    |
| [Solr]          | 8, 7, 6, 5       | [wodby/solr]                       |               |                    |
| [Elasticsearch] | 7, 6             | [wodby/elasticsearch]              |               |                    |
| [Kibana]        | 7, 6             | [wodby/kibana]                     |               |                    |
| [AthenaPDF]     | 2.16.0           | [arachnysdocker/athenapdf-service] |               |                    |
| [Mailhog]       | latest           | [mailhog/mailhog]                  |               | ✓                  |
| [OpenSMTPD]     | 6.0              | [wodby/opensmtpd]                  |               |                    |
| [Rsyslog]       | latest           | [wodby/rsyslog]                    |               |                    |
| [Blackfire]     | latest           | [blackfire/blackfire]              |               |                    |
| [Webgrind]      | 1                | [wodby/webgrind]                   |               |                    |
| [XHProf viewer] | latest           | [wodby/xhprof]                     |               |                    |
| Adminer         | 4.6              | [wodby/adminer]                    |               |                    |
| phpMyAdmin      | latest           | [phpmyadmin/phpmyadmin]            |               |                    |
| Traefik         | latest           | [_/traefik]                        | ✓             | ✓                  |
                                                                                                 
## Documentation                                                                                 

Full documentation is available at https://wodby.com/docs/stacks/wordpress/local.

## Images' tags

Images tags format is `[VERSION]-[STABILITY_TAG]` where:

`[VERSION]` is the _version of an application_ (without patch version) running in a container, e.g. `wodby/nginx:1.15-x.x.x` where Nginx version is `1.15` and `x.x.x` is a stability tag. For some images we include both major and minor version like PHP `7.2`, for others we include only major like Redis `5`. 

`[STABILITY_TAG]` is the _version of an image_ that corresponds to a git tag of the image repository, e.g. `wodby/mariadb:10.2-3.3.8` has MariaDB `10.2` and stability tag [`3.3.8`](https://github.com/wodby/mariadb/releases/tag/3.3.8). New stability tags include patch updates for applications and image's fixes/improvements (new env vars, orchestration actions fixes, etc). Stability tag changes described in the corresponding a git tag description. Stability tags follow [semantic versioning](https://semver.org/).

We highly encourage to use images only with stability tags.

## Maintenance

We regularly update images used in this stack and release them together, see [releases page](https://github.com/wodby/docker4wordpress/releases) for full changelog and update instructions. Most of routine updates for images and this project performed by [the bot](https://github.com/wodbot) via scripts located at [wodby/images](https://github.com/wodby/images).

## Beyond local environment

Docker4WordPress is a project designed to help you spin up local environment with docker-compose. If you want to deploy a consistent stack with orchestrations to your own server, check out [![WordPress stack on Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com/stacks/wordpress).

## Other Docker4x projects

* [docker4php](https://github.com/wodby/docker4php)
* [docker4drupal](https://github.com/wodby/docker4drupal)
* [docker4ruby](https://github.com/wodby/docker4ruby)
* [docker4python](https://github.com/wodby/docker4python)

## License

This project is licensed under the MIT open source license.

[Apache]: https://wodby.com/docs/stacks/wordpress/containers#apache
[AthenaPDF]: https://wodby.com/docs/stacks/wordpress/containers#athenapdf
[Blackfire]: https://wodby.com/docs/stacks/wordpress/containers#blackfire
[Elasticsearch]: https://wodby.com/docs/stacks/elasticsearch
[Kibana]: https://wodby.com/docs/stacks/elasticsearch
[Mailhog]: https://wodby.com/docs/stacks/wordpress/containers#mailhog
[MariaDB]: https://wodby.com/docs/stacks/wordpress/containers#mariadb
[Memcached]: https://wodby.com/docs/stacks/wordpress/containers#memcached
[Nginx]: https://wodby.com/docs/stacks/wordpress/containers#nginx
[Node.js]: https://wodby.com/docs/stacks/wordpress/containers#nodejs
[OpenSMTPD]: https://wodby.com/docs/stacks/wordpress/containers#opensmtpd
[PHP]: https://wodby.com/docs/stacks/wordpress/containers#php
[Redis]: https://wodby.com/docs/stacks/wordpress/containers#redis
[Rsyslog]: https://wodby.com/docs/stacks/wordpress/containers#rsyslog
[Solr]: https://wodby.com/docs/stacks/solr
[Varnish]: https://wodby.com/docs/stacks/wordpress/containers#varnish
[Webgrind]: https://wodby.com/docs/stacks/wordpress/containers#webgrind
[Wordpress]: https://wodby.com/docs/stacks/wordpress/containers#php
[XHProf viewer]: https://wodby.com/docs/stacks/php/containers#xhprof-viewer

[_/traefik]: https://hub.docker.com/_/traefik
[arachnysdocker/athenapdf-service]: https://hub.docker.com/r/arachnysdocker/athenapdf-service
[blackfire/blackfire]: https://hub.docker.com/r/blackfire/blackfire
[mailhog/mailhog]: https://hub.docker.com/r/mailhog/mailhog
[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin
[wodby/adminer]: https://github.com/wodby/adminer
[wodby/apache]: https://github.com/wodby/apache
[wodby/elasticsearch]: https://github.com/wodby/elasticsearch
[wodby/kibana]: https://github.com/wodby/kibana
[wodby/mariadb]: https://github.com/wodby/mariadb
[wodby/memcached]: https://github.com/wodby/memcached
[wodby/nginx]: https://github.com/wodby/nginx
[wodby/node]: https://github.com/wodby/node
[wodby/opensmtpd]: https://github.com/wodby/opensmtpd
[wodby/redis]: https://github.com/wodby/redis
[wodby/rsyslog]: https://github.com/wodby/rsyslog
[wodby/solr]: https://github.com/wodby/solr
[wodby/varnish]: https://github.com/wodby/varnish
[wodby/webgrind]: https://hub.docker.com/r/wodby/webgrind
[wodby/wordpress-php]: https://github.com/wodby/wordpress-php
[wodby/wordpress]: https://github.com/wodby/wordpress
[wodby/xhprof]: https://github.com/wodby/xhprof
