#!/usr/bin/env bash

if [ ! -s ~/.ssh/known_hosts ]; then
    echo "::error file=$(basename "$0"),line=${LINENO},endLine=${LINENO},title=Assertion Error::\
~/.ssh/known_hosts is missing or empty."
    exit 1
fi