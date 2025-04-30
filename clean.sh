#!/bin/bash

docker compose down --volumes --remove-orphans

# Remove all containers, images, volumes, and networks

docker ps -a | awk '{print $1}' | tail -n +2 | xargs docker stop

docker ps -a | awk '{print $1}' | tail -n +2 | xargs docker rm -f

docker image ls -a | awk '{print $3}' | tail -n +2 | xargs docker rmi -f

docker volume ls | awk '{print $2}' | tail -n +2 | xargs docker volume rm -f

docker network ls | awk '{print $1}' | tail -n +2 | xargs docker network rm -f