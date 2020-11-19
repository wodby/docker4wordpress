#!/usr/bin/env bash

set -e

if [[ -n "${DEBUG}" ]]; then
    set -x
fi

docker-compose up -d
docker-compose exec -T nginx make check-ready -f /usr/local/bin/actions.mk
docker-compose exec -T php make check-ready -f /usr/local/bin/actions.mk
docker-compose exec -T varnish make check-ready max_try=5 -f /usr/local/bin/actions.mk
docker-compose exec -T mariadb make check-ready max_try=12 wait_seconds=3 -f /usr/local/bin/actions.mk
docker-compose exec -T php tests.sh
docker-compose down
