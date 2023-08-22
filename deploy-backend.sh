#!/bin/bash
set +e
sudo cat > .backend.env <<EOF

VIRTUAL_HOST=momo-backend
EOF

sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker pull gitlab.praktikum-services.ru:5050/std-013-59/momo-store/momo-backend:latest

set -e

if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" == "healthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-blue )" == "healthy" ];
then sudo docker-compose stop backend-green && sudo docker rm  backend-green && sudo docker-compose --env-file=.backend.env up -d backend-green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop backend-blue; exit;
fi

if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}'  backend-green )" == "unhealthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-blue )" == "unhealthy" ];
then sudo docker rm  backend-green && sudo docker-compose --env-file=.backend.env up -d backend-green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" != "healthy" ]; do
        sleep 1;
done
exit;
fi

if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" == "unhealthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-blue )" == "healthy" ];
then sudo docker-compose --env-file=.backend.env up -d backend-green
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop backend-blue; exit;
fi

if [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-green )" == "healthy" ] && [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-blue )" == "unhealthy" ];
then sudo docker-compose --env-file=.backend.env up -d backend-blue
while [ "$( sudo docker container inspect -f '{{.State.Health.Status}}' backend-blue )" != "healthy" ]; do
        sleep 1;
done
sudo docker-compose stop backend-green; exit;
fi
