FROM golang:1.22 as dev

# Установка curl
RUN apt-get update && apt-get install -y curl

# перезагрузка кода в реальном времени при сохранении файлов
WORKDIR /app
RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin
RUN go install github.com/air-verse/air@latest

CMD ["air", "-c", ".air.toml"]


FROM node:latest as web
WORKDIR /app
COPY web/setup.js .
COPY web/package.json .
COPY web/package-lock.json .
RUN npm install
COPY ./web/app .
CMD ["npm", "run", "dev"]