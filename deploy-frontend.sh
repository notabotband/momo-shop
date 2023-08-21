#!/bin/bash

set -e
sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker-compose pull
sudo docker compose run --rm  certbot certonly --webroot --webroot-path /var/www/certbot/ -d momo.myvalue.ru
sudo docker-compose up -d frontend
