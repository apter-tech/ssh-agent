#!/usr/bin/env sh

if [ -s "${HOME}/.ssh/known_hosts" ]; then
    #echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Assertion Error::\
#~/.ssh/known_hosts file should not exist after the job."
    #exit 1
fi