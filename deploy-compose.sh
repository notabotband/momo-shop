#!/bin/bash

set -e
sudo docker network create -d bridge momo_network || true
sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker-compose pull
sudo docker stop frontend || true
sudo docker rm frontend || true
set -e
sudo docker-compose up -d frontend
