# FROM golang:1.19 as base
# Создайте еще один этап под названием «dev», основанный на нашем «базовом» этапе (чтобы у нас был доступен golang)
# FROM base as dev

FROM golang:1.19 as dev
WORKDIR /app

# перезагрузка кода в реальном времени при сохранении файлов
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
RUN go install github.com/cosmtrek/air@latest
	
# CMD air
CMD ["air", "-c", ".air.toml"]