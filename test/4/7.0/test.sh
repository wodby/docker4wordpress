#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

WP_DOMAIN="$( echo "${BASE_URL}" | sed 's/https\?:\/\///' )"

make init -f /usr/local/bin/actions.mk

wp core install --url="${BASE_URL}" --title="WordPress 4" \
    --admin_user=admin --admin_password=admin --admin_email=admin@example.com

# TODO: test redis and varnish.
wp plugin install redis-cache --activate
wp plugin install vcaching --activate

echo -n "Checking WordPress homepage... "
curl -s -H "host: ${WP_DOMAIN}" "nginx" | grep -q "Welcome to WordPress"
echo "OK"
