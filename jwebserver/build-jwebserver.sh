#!/bin/sh

docker build -f Dockerfile.jvm -t jwebserver:jvm  .
docker run --rm -d --name jwebserver.jvm jwebserver:jvm
sleep 1
curl http://172.17.0.2:8000/index.html
curl http://172.17.0.2:8000/get_simple_1.json
docker stop jwebserver.jvm

docker build -f Dockerfile.static -t jwebserver:static .
docker run --rm -d --name jwebserver.static jwebserver:static
sleep 1
curl http://172.17.0.2:8000/index.html
curl http://172.17.0.2:8000/get_simple_1.json
docker stop jwebserver.static

docker build -f Dockerfile.upx -t jwebserver:upx .
docker run --rm -d --name jwebserver.upx jwebserver:upx
sleep 1
curl http://172.17.0.2:8000/index.html
curl http://172.17.0.2:8000/get_simple_1.json
docker stop jwebserver.upx

echo "Generated Docker Container Images"
docker images jwebserver


