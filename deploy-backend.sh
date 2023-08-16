#!/bin/bash
set +e
sudo cat > .backend.env <<EOF

VIRTUAL_HOST=momo-backend
EOF

sudo docker network create -d bridge momo_network || true
sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker pull gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-backend:latest

set -e

if [ "$(sudo docker inspect --format "{{.State.Health.Status}}" $(sudo docker-compose ps -q backend-blue))" == "healthy" ]; then
  sudo docker-compose --env-file .backend.env up -d backend-green
  until [ "$(sudo docker inspect --format "{{.State.Health.Status}}" $(sudo docker-compose ps -q backend-green))" == "healthy" ]; do sleep 5; done
  sudo docker-compose stop backend-blue
else
  sudo docker-compose --env-file .backend.env up -d backend-blue
  until [ "$(sudo docker inspect --format "{{.State.Health.Status}}" $(sudo docker-compose ps -q backend-blue))" == "healthy" ]; do sleep 5; done
  sudo docker-compose stop backend-green
fi