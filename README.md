# http-dump

``` bash
go run main.go

docker build -t http-dump:latest .

docker save http-dump:latest | gzip > http-dump.tar.gz

gunzip -c http-dump.tar.gz | docker load

docker run --rm -p 8080:8080 -it http-dump:latest
```
