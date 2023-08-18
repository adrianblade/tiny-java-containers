#!/bin/sh

docker build -f Dockerfile.jvm -t webserver:jvm .
docker run --rm -d --name webserver.jvm -p 8080:8080 webserver:jvm
sleep 1
curl http://localhost:8080/
docker stop webserver.jvm

docker build -f Dockerfile.static -t webserver:static .
docker run --rm -d --name webserver.static -p 8080:8080 webserver:static
sleep 1
curl http://localhost:8080/
docker stop webserver.static

echo "Generated Docker Container Images"
docker images webserver





