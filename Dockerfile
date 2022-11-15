FROM golang:1.14      # for time optimization

USER 0
ENV GO111MODULE=on

RUN mkdir -p /app

WORKDIR /app/
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o server -ldflags="-w -s" .
EXPOSE 3000
ENTRYPOINT /app/server
