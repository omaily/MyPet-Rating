launch:
	protoc --go_out=. --go-grpc_out=. api/proto/manga.proto
	sudo docker compose up --build
	sudo docker compose --profile tools run --rm migrate up
# ... migrate down 1 -- откатится на 1

migrate-create: ## создает новые файлы up-down manga.sql 
	sudo docker compose --profile tools run create-migration $(name)

sh-app: ##подключится к контейнеру golang
# при страрте 
	sudo docker compose run --rm --service-ports app bash
# на горячую
	sudo docker compose exec -it app bash	

sh-db: ##подключится к контейнеру postgre
	sudo docker compose -f docker-compose.yml exec db psql -U critic -d rating

rm:
	sudo docker rm -vf $$(sudo docker ps -aq)
	sudo docker rmi -f $$(sudo docker images -aq)
	sudo docker volume rm $$(sudo docker volume ls -f dangling=true -q)
cli: ##вызов аргументов в MAKEFILE:: make cli flag='start --env dev'
	go build
	go install 
	api-protobuf $(flag) 
