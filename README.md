- создали файл protobuf 
- скомпилировали
> protoc -I=. --go_out=plugins=grpc:. --go_opt=path=source_relative proto/title.proto
- docker-compose
>services.app.build.target  -- Установлено значение «dev» для Dockerfile dev этапа\
>ervices.app.volumes[0]      -- Mонтирует текущий каталог в то же самое WORKDIRна этапе «dev» нашего Dockerfile
- команды для докера
>sudo docker compose run --rm --service-ports web bash   
>sudo docker rm -vf $(sudo docker ps -aq)$\
>sudo docker rmi -f $(sudo docker images -aq)
- Создали конфиг файл 
- Добавили вызов с помощью командной строки *пакет-/urfave/cli 
- После команды `make build` изменить значения параметра full_bin в файле air.toml 
который отвечает за аргументы, при запуска сервиса из командной строки 
- Подключится к бд
>sudo docker compose -f docker-compose.yml exec db psql -U postgres -d postgres
