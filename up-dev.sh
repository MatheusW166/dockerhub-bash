#!/bin/bash

export FILE=your_docker_compose_file

docker compose -f $FILE  down --volumes --remove-orphans && 
docker compose -f $FILE up -d saoadm-rotinas-dev &&
docker compose -f $FILE logs -f
