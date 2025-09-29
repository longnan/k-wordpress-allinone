#!/bin/bash

echo "------------------------------------------------------------"
echo "-- Uninstalling AIO for kenlongnan.wang                   --"
echo "------------------------------------------------------------"
source env.sh

echo "------------------------------------------------------------"
echo "-- Stopping and removing containers...                    --"
echo "------------------------------------------------------------"
docker compose -f ../images/traefik/docker-compose.yml down -v
docker compose -f ../images/portainer/docker-compose.yml down -v
docker compose -f ../images/wordpress/docker-compose.yml down -v
docker compose -f ../images/mysql/docker-compose.yml down -v

echo "-- Pruning all stopped containers...                      --"
sleep 10s
docker container prune -f

echo "-- Removing & Pruning all data volumes...                 --"
docker volume rm k_portainer_data
docker volume rm k_mysql_data
docker volume rm k_wordpress_data

docker volume prune -f

echo "------------------------------------------------------------"
echo "-- Removing network...                                    --"
echo "------------------------------------------------------------"
docker network rm k-core

echo "------------------------------------------------------------"
echo "-- List all                                               --"
echo "------------------------------------------------------------"
docker ps
docker volume ls
docker network ls

echo "------------------------------------------------------------"
echo "-- Uninstall Done!                                        --"
echo "------------------------------------------------------------"
