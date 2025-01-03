#!/usr/bin/env sh

TEMP_FILE="/tmp/718f4157-5493-43b2-837b-3ccb27f78e7b"

head --lines=-1 "${SSH_KNOWN_HOSTS_FILE}" > "${TEMP_FILE}"
cat "${TEMP_FILE}" > "${SSH_KNOWN_HOSTS_FILE}"
rm -rf "${TEMP_FILE}"

echo "::notice file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Notice::\
${SSH_KNOWN_HOSTS_FILE} has been cleaned."

unset TEMP_FILE