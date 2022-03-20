FROM golang:1.18-bullseye AS builder

WORKDIR /go/src/github.com/tosone/http-dump

COPY main.go .
COPY go.mod .

RUN go build -o http-dump . && mkdir -p /go/bin && cp http-dump /go/bin/http-dump

FROM debian:bullseye-slim

COPY --from=builder /go/bin/http-dump /usr/bin

EXPOSE 8080

CMD ["http-dump"]
