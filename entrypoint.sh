#!/bin/bash
#
# Create default config file if it doesn't exist
#
CONFIG_FILE="/home/node/charmonator/conf/config.json"

if [ ! -f "$CONFIG_FILE" ]; then
    if [ -n "$CHARMONATOR_CONFIG" ]; then
        printf '%s\n' "$CHARMONATOR_CONFIG" > "$CONFIG_FILE"
    else
        node scripts/generate-example-config.js > "$CONFIG_FILE"
    fi
fi

node server.mjs
