#!/bin/bash

set -e
docker network create -d bridge momo_network || true
sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker-compose pull
docker stop frontend || true
docker rm frontend || true
set -e
docker-compose up -d frontend
