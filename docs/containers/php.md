PHP is used with Nginx via PHP-FPM. Check out [the instructions (step 5)](#instructions) to learn how to switch the version.

## WP CLI

PHP container has installed wp cli. When running wp cli make sure to open the shell as user 82 (www-data) to avoid access problems in the web server, which is running as user 82, too:
```bash
$ docker-compose exec --user 82 php wp cli version
```

## Composer

PHP container has installed composer. Example:
```bash
$ docker-compose exec --user 82 php composer update
```

## Xdebug

If you want to use Xdebug, uncomment this line to enable it in the compose file before starting containers:
```yml
PHP_XDEBUG_ENABLED: 1       # Comment out to disable (default).
```

If you would like to autostart xdebug, uncomment this line:
```yml
PHP_XDEBUG_AUTOSTART: 1     # Comment out to disable (default).
```

## Xdebug on Mac OS X

There are two more things that need to be done on Mac OS X in order to have Xdebug working. Uncomment `PHP_XDEBUG_ENABLED` to enable Xdebug and uncomment the following two lines:

```yml
PHP_XDEBUG_REMOTE_CONNECT_BACK: 0         # Disabled for remote.host to work (enabled by default)
PHP_XDEBUG_REMOTE_HOST: "10.254.254.254"  # Setting the host (localhost by default)
```

It is also needed to have localhost loopback alias with IP from above. You need this only once and that settings stays active until logout or restart.

```bash
sudo ifconfig lo0 alias 10.254.254.254
```
