# Redis container

## Integration

To spin up a container with Redis cache and use it as a default cache storage follow these steps:

1. Uncomment lines with redis service definition in the compose file.
2. Download and install [Redis Object Cache plugin](https://wordpress.org/plugins/redis-cache/)
3. Add the following lines to the wp-config.php file:

```php
define('WP_REDIS_HOST', 'redis');
define('WP_REDIS_PORT', '6379');
```

## Customization

You can find more information about redis configuration on [wodby/redis](https://github.com/wodby/redis).