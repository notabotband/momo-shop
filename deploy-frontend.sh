#!/bin/bash

set -e
sudo docker login -u $CI_REGISTRY_USER -p $CI_REGISTRY_PASSWORD $CI_REGISTRY
sudo docker-compose pull
sudo docker-compose up -d frontend

