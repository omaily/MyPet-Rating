- создали файл protobuf , скомпилировали
> protoc -I=. --go_out=plugins=grpc:. --go_opt=path=source_relative proto/title.proto
- команды для докера можно найти в makefile
- После команды `make build` изменил значения параметра full_bin в файле air.toml 
- после скачивания проекта выполним команды 
> docker compose build  
> docker compose up  
>> docker compose --profile tools run --rm migrate    
>> /*иначе web упадет потому что таблицы нет */  

