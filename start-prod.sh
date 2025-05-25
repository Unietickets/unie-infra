#!/bin/bash

# Script to start the production environment
# Set the working directory to the script's directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

# Check if docker-data directories exist, create if not
if [ ! -d "./docker/docker-data" ]; then
  echo "Creating docker-data directories..."
  ./docker/init-docker-dirs.sh
fi

# Check if .env.production exists in the docker directory
if [ ! -f "./docker/.env.production" ]; then
  echo "Error: ./docker/.env.production file not found!"
  echo "Please create the environment file before running this script."
  exit 1
fi

echo "Starting production environment with build..."
docker compose -f ./docker/docker-compose.yml -f ./docker/docker-compose.prod.yml --env-file ./docker/.env.production up -d --build

echo "Production environment started successfully!"
