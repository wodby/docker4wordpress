-include env_make

.PHONY: test

wordpress ?= 4
php ?= 7.1

default: test

test:
	cd ./test/$(wordpress)/$(php) && ./run.sh
