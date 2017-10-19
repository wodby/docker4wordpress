-include env_make

.PHONY: test

WORDPRESS_VER ?= 4
PHP_VER ?= 7.1

default: test

test:
	cd ./test/$(WORDPRESS_VER)/$(PHP_VER) && ./run.sh
