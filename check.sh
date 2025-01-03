#!/usr/bin/env sh

SSH_KNOWN_HOSTS_FILE="${HOME}/.ssh/known_hosts"

if ! grep -q "${SSH_KNOWN_HOSTS}" "${SSH_KNOWN_HOSTS_FILE}"; then
    echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Assertion Error::\
${SSH_KNOWN_HOSTS_FILE} file should contain the ssh fingerprint."
    exit 1
fi

unset SSH_KNOWN_HOSTS_FILE