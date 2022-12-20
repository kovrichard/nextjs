.PHONY: start stop restart build sh logs

container=next

# start all the containers
start:
	docker compose up -d

# stop all the containers
stop:
	docker compose down

# restart containers
restart: stop start

# build the app container
build:
	docker compose build

# get a shell within the app container
sh:
	docker compose exec $(container) /bin/sh

# check console output
logs:
	docker compose logs -f
