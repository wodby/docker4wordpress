# Docker4WordPress Changelog

## 2.2.0

* New [Apache 2.4 container](http://docs.docker4wordpress.org/en/latest/containers/apache)
* New [AthenaPDF container](http://docs.docker4wordpress.org/en/latest/containers/athenapdf), drop-in replacement for wkhtmltopdf
* WordPress: updated Vanilla WordPress 4.8
* PHP: updated PHP 7: 7.0.20, 7.1.6
* PHP: images rebased to Alpine Linux 3.6 and now use LibreSSL instead of OpenSSL
* PHP: extension are now frozen, see https://github.com/wodby/php
* PHP: runtime libraries are now frozen
* PHP: mongoDB extension downgraded to 1.1.10
* PHP: expose header now disabled by default
* PHP: dropped few environment variables
* PHP: APCu extension is now configurable
* Nginx: new version 1.13, 1.12
* Nginx: 1.10 dropped
* Nginx: you can now override include of wordpress.conf file
* MariaDB: revamped optimized configuration
* Bug fix: resolved imagick segfault caused by a bug in ImageMagick library
* Bug fix: some environment variables missed in SSH container
* [New way](http://docs.docker4wordpress.org/en/latest/macos) to improve volumes performance on macOS] via user-guided caching

## 2.1.0

* New 2.1.0 images for php, nginx, mariadb, redis and varnish
* Updated documentation
* New [Vanilla WordPress option](http://docs.docker4wordpress.org/en/latest/#1-run-vanilla-wordpress-from-image-default) is now default 
* traefik.yml to [run multiple projects simultaneously](http://docs.docker4wordpress.org/en/latest/multiple-projects/)

## 2.0.0

* IMPORTANT: MariaDB container now has no volume defined via compose file. The volume is already defined in its Dockerfile, so Docker will create and mount volume automatically. Do not use docker-compose down unless you want to purge your volumes. If you restart docker or use docker-compose stop the volume will persist
* All-new 2.0.0 docker images: [wordpress-nginx](https://github.com/wodby/wordpress-nginx/), [wordpress-php](https://github.com/wodby/wordpress-php/), [mariadb](https://github.com/wodby/mariadb/), [redis](https://github.com/wodby/redis/), [wordpress-varnish](https://github.com/wodby/wordpress-varnish/). You can now customize images with environment variable and override entire configs by using .tpl template (based on confd)
* Performance improvement for macOS (OSX) users: a new way to sync codebase files is now described. It's based on [docker-sync](https://github.com/EugenMayer/docker-sync/) project. Docker is now usable for development on mac. See documentation
* Versions of images, except official, are now frozen. A new version will be released when a newer image version is available
* Domains support via Traefik
* We now have [slack](https://slack.wodby.com/) where you can any questions about docker4wordpress
* PHP versions: 7.0/7.1 based on officials
* Extended list of PHP extensions
* New documentation http://docs.docker4wordpress.org/
* License file added (MIT)
* Changelog file added

### Action Required Before Upgrading

* Since MariaDB now uses volume defined in Dockerfile instead of docker-compose, you should export your database and import it again (use mariadb-init volume for this)
* Do not use `docker-compose down` command because it will purge MariaDB volume. Instead use `docker-compose stop`. If you restart Docker you WILL NOT lose your data