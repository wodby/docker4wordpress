include docker.mk

.PHONY: test

PHP_VER ?= 7.4

test:
	cd ./tests && PHP_VER=$(PHP_VER) ./run.sh
