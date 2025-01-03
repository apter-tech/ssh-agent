#!/usr/bin/env sh

SSH_KNOWN_HOSTS_FILE="${HOME}/.ssh/known_hosts"

rm -rf "${SSH_KNOWN_HOSTS_FILE}"

echo "::notice file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Notice::\
${SSH_KNOWN_HOSTS_FILE} has been removed."

unset SSH_KNOWN_HOSTS_FILE
