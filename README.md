# Docker-based WordPress Stack

[![Build Status](https://github.com/wodby/docker4wordpress/workflows/Run%20tests/badge.svg)](https://github.com/wodby/docker4wordpress/actions)

## Introduction

Docker4WordPress is a set of docker images optimized for WordPress. Use `compose.yml` file from this repository to spin
up a local environment for WordPress on Linux, macOS and Windows.

* Read the docs on [**how to use**](https://wodby.com/docs/stacks/wordpress/local#usage)
* Ask questions on [Discord](http://discord.wodby.com/)
* Ask questions on [Slack](http://slack.wodby.com/)
* Follow [@wodbycloud](https://twitter.com/wodbycloud) for future announcements

## Stack

The WordPress stack consist of the following containers:

| Container             | Versions               | Image                                     | ARM64 support | Enabled by default |
|-----------------------|------------------------|-------------------------------------------|---------------|--------------------|
| [Nginx]               | 1.29, 1.28             | [wodby/nginx]                             | ✓             | ✓                  |
| [Apache]              | 2.4                    | [wodby/apache]                            | ✓             |                    |
| [WordPress]           | 6                      | [wodby/wordpress]                         | ✓             | ✓                  |
| [PHP]                 | 8.4, 8.3, 8.2, 8.1     | [wodby/wordpress-php]                     | ✓             |                    |
| Crond                 |                        | [wodby/wordpress-php]                     | ✓             | ✓                  |
| [MariaDB]             | 11.4, 10.6, 10.5, 10.4 | [wodby/mariadb]                           | ✓             | ✓                  |
| [Valkey]              | 8.1, 8.0, 7            | [wodby/valkey]                            | ✓             |                    |
| [Memcached]           | 1                      | [wodby/memcached]                         | ✓             |                    |
| [Varnish]             | 6.0                    | [wodby/varnish]                           | ✓             |                    |
| [Node.js]             | 24, 22, 20             | [wodby/node]                              | ✓             |                    |
| [Solr]                | 9                      | [wodby/solr]                              | ✓             |                    |
| OpenSearch            | 2                      | [opensearchproject/opensearch]            | ✓             |                    |
| OpenSearch Dashboards | 2                      | [opensearchproject/opensearch-dashboards] | ✓             |                    |
| Gotenberg             | latest                 | [gotenberg/gotenberg]                     | ✓             |                    |
| Mailpit               | latest                 | [axllent/mailpit]                         | ✓             | ✓                  |
| [OpenSMTPD]           | 7                      | [wodby/opensmtpd]                         | ✓             |                    |
| [Rsyslog]             | latest                 | [wodby/rsyslog]                           | ✓             |                    |
| [Webgrind]            | 1                      | [wodby/webgrind]                          | ✓             |                    |
| [XHProf viewer]       | latest                 | [wodby/xhprof]                            | ✓             |                    |
| Adminer               | 5                      | [wodby/adminer]                           | ✓             |                    |
| phpMyAdmin            | latest                 | [phpmyadmin/phpmyadmin]                   |               |                    |
| Traefik               | latest                 | [_/traefik]                               | ✓             | ✓                  |

## Documentation

Full documentation is available at https://wodby.com/docs/stacks/wordpress/local.

## Images' tags

Images tags format is `[VERSION]-[STABILITY_TAG]` where:

`[VERSION]` is the _version of an application_ (without patch version) running in a container,
e.g. `wodby/nginx:1.15-x.x.x` where Nginx version is `1.15` and `x.x.x` is a stability tag. For some images we include
both major and minor version like PHP `7.2`, for others we include only major like Valkey `7`.

`[STABILITY_TAG]` is the _version of an image_ that corresponds to a git tag of the image repository,
e.g. `wodby/mariadb:10.2-3.3.8` has MariaDB `10.2` and stability
tag [`3.3.8`](https://github.com/wodby/mariadb/releases/tag/3.3.8). New stability tags include patch updates for
applications and image's fixes/improvements (new env vars, orchestration actions fixes, etc). Stability tag changes
described in the corresponding a git tag description. Stability tags follow [semantic versioning](https://semver.org/).

We highly encourage to use images only with stability tags.

## Maintenance

We regularly update images used in this stack and release them together,
see [releases page](https://github.com/wodby/docker4wordpress/releases) for full changelog and update instructions. Most
of routine updates for images and this project performed by [the bot](https://github.com/wodbot) via scripts located
at [wodby/images](https://github.com/wodby/images).

## Beyond local environment

Docker4WordPress is a project designed to help you spin up local environment with Docker Compose. If you want to deploy
a consistent stack with orchestrations to your own server, check
out [![WordPress stack on Wodby](https://www.google.com/s2/favicons?domain=wodby.com) Wodby](https://wodby.com/stacks/wordpress).

## Other Docker4x projects

* [docker4php](https://github.com/wodby/docker4php)
* [docker4drupal](https://github.com/wodby/docker4drupal)
* [docker4ruby](https://github.com/wodby/docker4ruby)
* [docker4python](https://github.com/wodby/docker4python)

## License

This project is licensed under the MIT open source license.

[Apache]: https://wodby.com/docs/stacks/wordpress/containers#apache

[MariaDB]: https://wodby.com/docs/stacks/wordpress/containers#mariadb

[Memcached]: https://wodby.com/docs/stacks/wordpress/containers#memcached

[Nginx]: https://wodby.com/docs/stacks/wordpress/containers#nginx

[Node.js]: https://wodby.com/docs/stacks/wordpress/containers#nodejs

[OpenSMTPD]: https://wodby.com/docs/stacks/wordpress/containers#opensmtpd

[PHP]: https://wodby.com/docs/stacks/wordpress/containers#php

[Rsyslog]: https://wodby.com/docs/stacks/wordpress/containers#rsyslog

[Solr]: https://wodby.com/docs/stacks/solr

[Varnish]: https://wodby.com/docs/stacks/wordpress/containers#varnish

[Valkey]: https://wodby.com/docs/stacks/wordpress/containers#valkey

[Webgrind]: https://wodby.com/docs/stacks/wordpress/containers#webgrind

[Wordpress]: https://wodby.com/docs/stacks/wordpress/containers#php

[XHProf viewer]: https://wodby.com/docs/stacks/php/containers#xhprof-viewer

[_/traefik]: https://hub.docker.com/_/traefik

[gotenberg/gotenberg]: https://hub.docker.com/r/gotenberg/gotenberg

[axllent/mailpit]: https://hub.docker.com/r/axllent/mailpit

[phpmyadmin/phpmyadmin]: https://hub.docker.com/r/phpmyadmin/phpmyadmin

[wodby/adminer]: https://github.com/wodby/adminer

[wodby/apache]: https://github.com/wodby/apache

[wodby/mariadb]: https://github.com/wodby/mariadb

[wodby/memcached]: https://github.com/wodby/memcached

[wodby/nginx]: https://github.com/wodby/nginx

[wodby/node]: https://github.com/wodby/node

[wodby/opensmtpd]: https://github.com/wodby/opensmtpd

[wodby/valkey]: https://github.com/wodby/valkey

[wodby/rsyslog]: https://github.com/wodby/rsyslog

[wodby/solr]: https://github.com/wodby/solr

[wodby/varnish]: https://github.com/wodby/varnish

[wodby/webgrind]: https://hub.docker.com/r/wodby/webgrind

[wodby/wordpress-php]: https://github.com/wodby/wordpress-php

[wodby/wordpress]: https://github.com/wodby/wordpress

[wodby/xhprof]: https://github.com/wodby/xhprof

[opensearchproject/opensearch]: https://hub.docker.com/r/opensearchproject/opensearch

[opensearchproject/opensearch-dashboards]: https://hub.docker.com/r/opensearchproject/opensearch-dashboards
