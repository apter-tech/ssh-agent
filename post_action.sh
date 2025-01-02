#!/usr/bin/env sh

if [ -z "${SSH_KNOWN_HOSTS_FILE}" ]; then
    echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Notice::\
${SSH_KNOWN_HOSTS_FILE} environment variable must be set."
#else
    # rm -rf "${SSH_KNOWN_HOSTS_FILE}"
    #echo "::notice file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Notice::\
#${SSH_KNOWN_HOSTS_FILE} has been removed."
fi