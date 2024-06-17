#!/bin/bash -e

DOCKER_COMPOSE_COMMAND=""
if docker compose version &> /dev/null; then
  DOCKER_COMPOSE_COMMAND="docker compose"
elif docker-compose version &> /dev/null; then
  DOCKER_COMPOSE_COMMAND="docker-compose"
else
  echo "Docker Compose does not exist. Please install it first https://docs.docker.com/compose/install/"
  exit 1
fi

cd "$(dirname "$0")"

$DOCKER_COMPOSE_COMMAND -f docker-compose.yml up -d --build