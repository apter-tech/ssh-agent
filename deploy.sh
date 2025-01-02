#!/usr/bin/env sh

# renovate: datasource=docker depname=traefik/whoami versioning=docker
WHOAMI_VERSION="v1.10"
CONTAINER_NAME="${RUNNER_OS}-whoami"
docker run --detach --publish-all --name "${CONTAINER_NAME}" traefik/whoami:"${WHOAMI_VERSION}"
docker stop "${CONTAINER_NAME}"
docker rm "${CONTAINER_NAME}"

unset WHOAMI_VERSION
unset CONTAINER_NAME