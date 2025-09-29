#!/bin/bash

echo "------------------------------------------------------------"
echo "-- Updating AIO for kenlongnan.wang                       --"
echo "------------------------------------------------------------"
source env.sh

echo "------------------------------------------------------------"
echo "-- Stopping and removing containers...                    --"
echo "------------------------------------------------------------"
docker compose -f ../images/traefik/docker-compose.yml down -v
docker compose -f ../images/portainer/docker-compose.yml down -v
docker compose -f ../images/wordpress/docker-compose.yml down -v

echo "------------------------------------------------------------"
echo "-- Recreate container                                     --"
echo "------------------------------------------------------------"
docker compose -f ../images/traefik/docker-compose.yml up --force-recreate -d
docker compose -f ../images/portainer/docker-compose.yml up --force-recreate -d
docker compose -f ../images/wordpress/docker-compose.yml up --force-recreate -d

sleep 10s

echo "------------------------------------------------------------"
echo "-- List all                                               --"
echo "------------------------------------------------------------"
docker network ls
docker volume ls
docker ps

echo "------------------------------------------------------------"
echo "-- Update Done!                                           --"
echo "------------------------------------------------------------"

