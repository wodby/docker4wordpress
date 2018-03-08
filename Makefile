include docker.mk

.PHONY: test

WORDPRESS_VER ?= 4
PHP_VER ?= 7.2

test:
	cd ./test/$(WORDPRESS_VER) && PHP_VER=$(PHP_VER) ./run
