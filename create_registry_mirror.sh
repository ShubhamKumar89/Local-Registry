#!/bin/bash

# Set the mirror storage location and the upstream registry URL
MIRROR_STORAGE_PATH="/opt/docker-registry-mirror"
UPSTREAM_REGISTRY_URL="https://registry-1.docker.io"

# Create the storage directory for the mirror
mkdir -p ${MIRROR_STORAGE_PATH}

# Run the Docker registry mirror container
docker run -d \
  --restart=always \
  --name registry-mirror \
  -p 5000:5000 \
  -v ${MIRROR_STORAGE_PATH}:/var/lib/registry \
  -e REGISTRY_PROXY_REMOTEURL=${UPSTREAM_REGISTRY_URL} \
  registry:2
