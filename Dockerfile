FROM golang:latest

WORKDIR /usr/src/app

#RUN go mod init docker-final-main
COPY . ./

RUN go mod tidy
RUN go mod download 

RUN CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o /my_app
RUN chmod +x ./

CMD ["/my_app"]