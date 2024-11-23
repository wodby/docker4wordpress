include docker.mk

.PHONY: test

PHP_VER ?= 8.4

test:
	cd ./tests && PHP_VER=$(PHP_VER) ./run.sh
