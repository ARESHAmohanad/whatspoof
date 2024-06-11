#!/bin/bash

# -e Exit the script if any statement returns a non-true return value
# -o pipefail Exit the script if any uninitialised variable is used
set -eo pipefail
# 
shopt -s nullglob

# if command starts with an option, prepend whatsbot
if [ "${1:0:1}" = '-' ]; then
    echo "Prepending 'squid' to the command..."
    set -- /app/explowhats-spoofingit "$@"
fi

# Start in the foreground or run the command passed as arguments to the entrypoint script
if [ "$1" = '' ]; then
    echo "Starting whatsbot in the foreground..."
    /app/whats-spoofing
    sleep 5
else
    echo "Running command passed as arguments to the entrypoint script..."
    echo "Command: $@"
    exec "$@"
fi
