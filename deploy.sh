#!/usr/bin/env sh

# renovate: datasource=docker depname=traefik/whoami versioning=docker
WHOAMI_VERSION="v1.10"
docker run --detach --publish-all --name whoami traefik/whoami:"${WHOAMI_VERSION}"
docker stop whoami
docker rm whoami