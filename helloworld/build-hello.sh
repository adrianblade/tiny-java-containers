#!/bin/sh

echo "Generating docker images ..."

docker build . -f Dockerfile.jvm -t hello:jvm

docker build . -f Dockerfile.static -t hello:static

docker build . -f Dockerfile.upx -t hello:upx

echo "Listing ..."
docker images | grep "hello"

echo "Executing ..."
docker run -it hello:jvm
docker run -it hello:static
docker run -it hello:upx

echo "Time hello:jvm: ..."
time docker run -it hello:jvm
echo "Time hello:static: ..."
time docker run -it hello:static
echo "Time hello:upx: ..."
time docker run -it hello:upx

