#!/usr/bin/make -f
build:
	docker-compose -p $(shell basename $(CURDIR)) build

up:
	docker-compose -p $(shell basename $(CURDIR)) up -d

down:
	@docker-compose -p $(shell basename $(CURDIR)) down

dev:
	docker exec -i -t docker-console /usr/bin/zsh

restart: down up #! restart all services

again: down build up dev #! all make again
