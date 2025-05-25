#!/bin/bash

# Create directories for Docker volumes
mkdir -p ./docker-data
mkdir -p ./docker-data/postgres
mkdir -p ./docker-data/pgadmin
mkdir -p ./docker-data/minio
mkdir -p ./docker-data/rabbitmq

# Set proper permissions
chmod 777 ./docker-data/postgres
chmod 777 ./docker-data/pgadmin
chmod 777 ./docker-data/minio
chmod 777 ./docker-data/rabbitmq

# Clean any temporary files that might be causing space issues
rm -rf ./docker-data/minio/tmp/* 2>/dev/null || true
