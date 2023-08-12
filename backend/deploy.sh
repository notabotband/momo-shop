#!/bin/bash
docker network create -d bridge momo_network || true
docker login gitlab.praktikum-services.ru:5050 -u $DOCKER_GITLAB_USER -p $DOCKER_GITLAB_TOCKEN
docker pull gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-backend:latest
docker stop momo-backend || true
docker rm momo-backend || true
set -e
docker run -d --name momo-backend \
    --network=momo_network \
    --restart always \
    --pull always \
    -p 81 \
    gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-backend:latest
