#!/bin/bash
docker network create -d bridge momo_network || true
docker login gitlab.praktikum-services.ru:5050 -u $DOCKER_GITLAB_USER -p $DOCKER_GITLAB_TOCKEN
docker pull gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-frontend:latest
docker stop momo-frontend || true
docker rm momo-frontend || true
set -e
docker run -d --name momo-frontend \
    --network=momo_network \
    --restart always \
    -p 80 \
    gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-frontend:latest
