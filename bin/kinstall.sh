#!/bin/bash

echo "------------------------------------------------------------"
echo "-- Installing AIO for kenlongnan.wang                     --"
echo "------------------------------------------------------------"
source env.sh

echo "------------------------------------------------------------"
echo "-- Creating docker network...                             --"
echo "------------------------------------------------------------"
docker network create -d bridge k-core

echo "------------------------------------------------------------"
echo "-- Creating data volume...                                --"
echo "------------------------------------------------------------"
docker volume create --name=k_portainer_data
docker volume create --name=k_mysql_data
docker volume create --name=k_wordpress_data

echo "------------------------------------------------------------"
echo "-- Starting container                                     --"
echo "------------------------------------------------------------"
docker compose -f ../images/traefik/docker-compose.yml up --force-recreate -d
docker compose -f ../images/portainer/docker-compose.yml up --force-recreate -d
docker compose -f ../images/mysql/docker-compose.yml up --force-recreate -d
docker compose -f ../images/wordpress/docker-compose.yml up --force-recreate -d

sleep 10s

echo "------------------------------------------------------------"
echo "-- List all                                               --"
echo "------------------------------------------------------------"
docker network ls
docker volume ls
docker ps

echo "------------------------------------------------------------"
echo "-- Installation Done!                                     --"
echo "------------------------------------------------------------"
