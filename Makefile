include docker.mk

.PHONY: test

PHP_VER ?= 8.1

test:
	cd ./tests && PHP_VER=$(PHP_VER) ./run.sh
