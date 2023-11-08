setting: 
# sudo docker compose run web air init -- создаст .air.toml
	
migrate-create: ## создает файлы up-down manga.sql
	sudo docker compose --profile tools run create-migration $(name)

migrate-up: ## Run migrations UP
# нужно проверить как будет работать с rm
	sudo docker compose --profile tools run --rm migrate  
# sudo docker compose --profile tools run migrate  

migrate-down:
	sudo docker compose --profile tools run --rm migrate  down 1

sh-db:
	sudo docker compose -f docker-compose.yml exec db psql -U critic -d rating

sh-web:
	sudo docker compose run --rm --service-ports web bash

build:
	protoc -I=. --go_out=plugins=grpc:. --go_opt=path=source_relative proto/title.proto
	sudo docker compose build

update:
	sudo docker compose run --rm web go mod tidy

run:
	sudo docker compose up

rm:
	sudo docker stop probackv30-web-1
	sudo docker stop probackv30-db-1
	sudo docker rm -vf $$(sudo docker ps -aq)
	sudo docker rmi -f $$(sudo docker images -aq)
	sudo docker volume rm $$(sudo docker volume ls -f dangling=true -q)

cli: 
	go build
	go install 
#вызов аргументов в MAKEFILE:: make cli flag='start --env dev'
	api-protobuf $(flag) 