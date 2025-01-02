#!/usr/bin/env bash

mkdir -p "$(dirname "${SSH_KNOWN_HOSTS_FILE}")"

if [ -z "${SSH_HOST}" ] && [ -z "${SSH_KNOWN_HOSTS}" ]; then
    echo ":error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Input validation::\
One of the input, 'ssh-host' or 'ssh-known-hosts' must be set. Please update your workflow inputs."
    exit 2
else
    if [ ! -z "${SSH_KNOWN_HOSTS}" ]; then
        if [ ! -z "${SSH_HOST}" ]; then
            echo "::warning file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Input validation::\
Both 'ssh-host' and 'ssh-known-hosts' inputs are set. Using 'ssh-known-hosts'."
        fi
        echo "${SSH_KNOWN_HOSTS}" >> "${SSH_KNOWN_HOSTS_FILE}"
    else
        echo "::warning file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Security risk::\
If an ssh_known_hosts file is constructed using ssh-keyscan without verifying the keys, \
users will be vulnerable to man in the middle attacks. On theother hand, if the security model allows such a risk, \
ssh-keyscan can help in the detection of tampered keyfiles or man in the middle attacks which have begun after \
the ssh_known_hosts file was created."
    
        if [ -z "${SSH_KEY_TYPE}" ]; then
            if ! ssh-keyscan "${SSH_HOST}" >> "${SSH_KNOWN_HOSTS_FILE}"; then
                echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=SSH Keyscan Failed::\
Failed to scan SSH host keys for ${SSH_HOST}"
                exit 1
            fi
        else
            if ! ssh-keyscan -t "${SSH_KEY_TYPE}" "${SSH_HOST}" >> "${SSH_KNOWN_HOSTS_FILE}"; then
                echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=SSH Keyscan Failed::\
Failed to scan SSH host keys for ${SSH_HOST}"
                exit 1
            fi
        fi
    fi
fi
