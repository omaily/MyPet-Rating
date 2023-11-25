setting: ## создаст .air.toml
	sudo docker compose run web air init

build:
	protoc -I=. --go_out=plugins=grpc:. --go_opt=path=source_relative proto/title.proto
	sudo docker compose build

migrate-create: ## создает новые файлы up-down manga.sql 
	sudo docker compose --profile tools run create-migration $(name)

migrate-up: 
	sudo docker compose --profile tools run --rm migrate up

migrate-down:
	sudo docker compose --profile tools run --rm migrate down 1

run:
	sudo docker compose up --build
	make migrate-up
	
sh-app: ##подключится к контейнеру golang
	sudo docker compose run --rm --service-ports app bash

sh-db: ##подключится к контейнеру postgre
	sudo docker compose -f docker-compose.yml exec db psql -U critic -d rating

sh-web: 
	sudo docker compose run --rm --service-ports web bash

update:
	sudo docker compose run --rm web go mod tidy

rm:
	sudo docker rm -vf $$(sudo docker ps -aq)
	sudo docker rmi -f $$(sudo docker images -aq)
	sudo docker volume rm $$(sudo docker volume ls -f dangling=true -q)

cli: ##вызов аргументов в MAKEFILE:: make cli flag='start --env dev'
	go build
	go install 
	api-protobuf $(flag) 
