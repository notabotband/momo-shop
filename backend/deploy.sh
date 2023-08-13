#!/bin/sh
docker network create -d bridge momo_network || true
docker login gitlab.praktikum-services.ru:5050 -u $REGISTRY_USER -p $REGISTRY_ACCESS_TOKEN
docker pull gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-frontend:latest
docker stop momo-frontend || true
docker rm momo-frontend || true
set -e
docker run -d --name momo-frontend \
    --network=momo_network \
    --restart always \
    -p 81 \
    gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-frontend:latest