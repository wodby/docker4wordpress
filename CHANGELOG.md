# Docker4WordPress Changelog

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