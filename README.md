# Native docker-based local environment for WordPress

Use this Docker compose file to spin up local environment for WordPress with a *native Docker app* on Linux, Mac OS X and Windows. 

Docker4WordPress is designed to be used for local development, if you're looking for a dev/staging/production solution check out Wodby. Use Wodby to deploy container-based infrastructure consistent with Docker4WordPress to any server.

* [Overview](#overview)
* [Instructions](#instructions)
* [Containers](#containers)
    * [Accessing containers](#accessing-containers)
    * [Nginx](#nginx)
    * [PHP](#php)
        * [Composer](#composer)
        * [Xdebug](#xdebug)    
    * [MariaDB](#mariadb)
        * [Import](#import)
        * [Export](#export)
    * [Redis](#redis)
    * [Memcached](#memcached)
    * [Mailhog](#mailhog)
    * [phpMyAdmin](#phpmyadmin)
    * [Apache Solr](#apache-solr)
    * [Varnish](#varnish)
* [Multiple projects](#multiple-projects)
* [Docroot in subdirectory](#docroot-in-subdirectory)
* [Logs](#logs)
* [Status](#status)

## Overview

The WordPress bundle consist of the following containers:

| Container | Service name | Image | Public Port | Enabled by default |
| --------- | ------------ | ----- | ----------- | ------------------ |
| [Nginx](#nginx) | nginx | <a href="https://hub.docker.com/r/wodby/wordpress-nginx/" target="_blank">wodby/wordpress-nginx</a> | 8000 | ✓ |
| [PHP 7](#php) | php | <a href="https://hub.docker.com/r/wodby/wordpress-php/" target="_blank">wodby/wordpress-php</a> |  | ✓ |
| [MariaDB](#mariadb) | mariadb | <a href="https://hub.docker.com/r/wodby/wordpress-mariadb/" target="_blank">wodby/wordpress-mariadb</a> | | ✓ |
| [phpMyAdmin](#phpmyadmin) | pma | <a href="https://hub.docker.com/r/phpmyadmin/phpmyadmin" target="_blank">phpmyadmin/phpmyadmin</a> | 8001 | ✓ |
| [Mailhog](#mailhog) | mailhog | <a href="https://hub.docker.com/r/mailhog/mailhog" target="_blank">mailhog/mailhog</a> | 8002 | ✓ |
| [Redis](#redis) | redis | <a href="https://hub.docker.com/_/redis/" target="_blank">redis/redis</a> |||
| [Memcached](#memcached) | memcached | <a href="https://hub.docker.com/_/memcached/" target="_blank">_/memcached</a> |||
| [Solr](#solr) | solr | <a href="https://hub.docker.com/_/solr" target="_blank">_/solr</a> | 8003 ||
| [Varnish](#varnish) | varnish | <a href="https://hub.docker.com/r/wodby/wordpress-varnish" target="_blank">wodby/wordpress-varnish</a> | 8004 ||

PHP, Nginx, MariaDB and Varnish configs are optimized to be used with WordPress. We regularly update this bundle with performance improvements, bug fixes and newer version of Nginx/PHP/MariaDB.

## Instructions 

__Feel free to adjust volumes and ports in the compose file for your convenience.__

1\. Install docker for <a href="https://docs.docker.com/engine/installation/" target="_blank">Linux</a>, <a href="https://docs.docker.com/engine/installation/mac" target="_blank">Mac OS X</a> or <a href="https://docs.docker.com/engine/installation/windows" target="_blank">Windows</a>. __For Mac and Windows make sure you're installing native docker app version 1.12, not docker toolbox.__ 

For Linux additionally install <a href="https://docs.docker.com/compose/install/" target="_blank">docker compose</a>

2\. Download <a href="https://raw.githubusercontent.com/Wodby/docker4wordpress/master/docker-compose.yml" target="_blank">the compose file</a> from this repository and put it to your WordPress project codebase (you might want to add docker-compose.yml to .gitignore). 

3\. Since containers <a href="https://docs.docker.com/engine/tutorials/dockervolumes/" target="_blank">do not have a permanent storage</a>, directories from the host machine (volumes) should be mounted: one with code of your WordPress project and another with database files. 

By default, the directory with the compose file (volume `./`) will be mounted to PHP container (assuming it's your codebase directory). Additionally `docker-runtime` directory will be created to store files for mariadb and, optionally, solr containers. Do not forget to add `docker-runtime` to your .gitignore file. 

**Linux only**: fix permissions for your files directory with:
```bash
$ sudo chgrp -R 82 sites/default/files
$ sudo chmod -R 775 sites/default/files
```

4\. Update database credentials in your wp-config.php file:
```
DB_NAME: wordpress
DB_USER: wordpress
DB_PASSWORD: wordpress
DB_HOST: mariadb
```

5\. If you want to import your database, uncomment the following line in the compose file:
```yml
#      - ./docker-runtime/mariadb-init:/docker-entrypoint-initdb.d # Place init .sql file(s) her
```

Create the volume directory `./docker-runtime/mariadb-init` in the same directory as the compose file and put there your SQL file(s). All SQL files will be automatically imported once MariaDB container has started.

6\. If you need to deploy one of the optional containers ([Redis](#redis), [Memcached](#memcached), [Apache Solr](#apache-solr)) uncomment the corresponding lines in the compose file.

7\. Now, let's run the compose file. It will download the images and run the containers:
```bash
$ docker-compose up -d
```

8\. Make sure all containers are running by executing:

```bash
$ docker-compose ps
```

9\. That's it! You wordpress website should be up and running at http://localhost:8000. 

## Containers

### Accessing containers

You can connect to any container by executing the following command:
```bash
$ docker-compose exec php sh
```

Replace `php` with the name of your service (e.g. `mariadb`, `nginx`, etc).

### Nginx

Nginx is being used as a web server. Nginx is pre-configured to be used with WordPress. 

### PHP

PHP is used with Nginx via PHP-FPM.

#### Composer

PHP container has installed composer. Example:
```bash
$ docker-compose exec --user 82 php composer update
```

#### Xdebug

If you want to use xdebug, enable the following option in the compose file:

```yml
PHP_XDEBUG_ENABLED: 0 # Set 1 to enable.
```

### MariaDB

#### Configuring

Many configuration options can be passed as flags without adjusting a cnf file. See example in the compose file:
```bash
#    command: --character-set-server=utf8mb4 --collation-server=utf8mb4_unicode_ci
```

#### Import

Check out [the instructions (step 7)](#instructions) to learn how to import your existing database. 

#### Export

Exporting all databases:

```bash
docker-compose exec mariadb sh -c 'exec mysqldump --all-databases -uroot -p"root-password"' > databases.sql
```

Exporting a specific database:

```bash
docker-compose exec mariadb sh -c 'exec mysqldump -uroot -p"root-password" my-db' > my-db.sql
```

### Redis

To spin up a container with Redis cache and use it as an object cache storage follow these steps:

1. Download and install plugin <a href="https://wordpress.org/plugins/redis-cache/" target="_blank">Redis Object Cache</a>
2. Add the following line to wp-config.php file:
```php
define('WP_REDIS_HOST', 'redis');
```

### Memcached

To spin up a container with Memcached and use it as an object cache storage follow these steps:

1. Download and install plugin <a href="https://wordpress.org/plugins/memcached" target="_blank">Memcached Object Cache</a>
2. Add the following line to wp-config.php file:
```php
$memcached_servers = array(
    'default' => array(
        'memcached:11211',
    ),
);
```

### Mailhog

By default, container with mailhog included in the bundle. It will catch all email sent from the PHP container. You can view emails by visiting its admin UI on localhost:8002.

### phpMyAdmin

By default, container with phpMyAdmin included in the bundle. You can access it by localhost:8001

### Apache Solr

To spin up a container with Apache Solr search engine uncomment lines with solr service definition in the compose file. Use  volume directory `./docker-runtime/solr` to access configuration files. Solr admin UI can be accessed by localhost:8003

### Varnish

To spin up a container with Varnish uncomment lines with varnish service definition in the compose file. Use the port specified in the compose file to access the website via Varnish.

## Multiple projects

To use D4D with multiple projects simply adjust the ports in the compose file, e.g. instead of ports 8000, 8001, 8002 you can use 7000, 7001, 7002.

## Docroot in subdirectory

If your docroot located in a subdirectory use options `PHP_DOCROOT` and `NGINX_DOCROOT` to specify the path (relative path inside the /var/www/html/ directory) for PHP and Nginx containers.

## Logs

To get logs from a container simply run (skip the last param to get logs form all the containers):
```
$ docker-compose logs [service]
```

Example: real-time logs of the PHP container:
```
$ docker-compose logs -f php
```

## Status

We're actively working on this instructions and containers. More options will be added soon. If you have a feature request or found a bug please submit an issue.

We update containers from time to time, to get the lastest changes simply run again:
```
$ docker-compose up -d
```

