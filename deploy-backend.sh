#!/bin/bash
docker network create -d bridge momo_network || true
docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
docker pull $CI_REGISTRY_IMAGE/momo-backend:latest
docker stop momo-frontend || true
docker rm momo-frontend || true
set -e
docker run -d --name momo-frontend \
    --network=momo_network \
    --restart always \
    -p 81 \
    gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-frontend:latest