#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec nginx make check-ready -f /usr/local/bin/actions.mk
docker-compose exec php make check-ready -f /usr/local/bin/actions.mk
docker-compose exec varnish make check-ready -f /usr/local/bin/actions.mk
docker-compose exec mariadb make check-ready max_try=12 wait_seconds=3 -f /usr/local/bin/actions.mk
docker-compose exec php tests.sh
docker-compose down
