.PHONY: build bundle bash start

build:
	docker-compose build

bundle:
	docker-compose run --rm bot bundle install

bash:
	docker-compose run --rm bot bash

start:
	docker-compose run --rm bot
