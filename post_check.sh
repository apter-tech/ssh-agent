#!/usr/bin/env sh

SSH_KNOWN_HOSTS_FILE="${HOME}/.ssh/known_hosts"

if [ -s "${SSH_KNOWN_HOSTS_FILE}" ] ; then
    echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Assertion Error::\
${SSH_KNOWN_HOSTS_FILE} file should be removed."
    exit 1
fi

unset SSH_KNOWN_HOSTS_FILE