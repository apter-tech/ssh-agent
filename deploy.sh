#!/usr/bin/env sh

# renovate: datasource=docker depname=traefik/whoami versioning=docker
WHOAMI_VERSION="43a68d10b9dfcfc3ffbfe4dd42100dc9aeaf29b3a5636c856337a5940f1b4f1c" # v1.10
docker run --detach --publish-all --name whoami traefik/whoami:"${WHOAMI_VERSION}"
docker stop whoami
docker rm whoami