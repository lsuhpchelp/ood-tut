#!/bin/bash

# Get the name of the currently active Conda environment
CURRENT_ENV=$(conda info --envs | awk '$1 ~ /^\*/ {print $1}' | sed 's/*//')

# Check if any Conda environment is active
if [[ -n "$CURRENT_ENV" ]]; then
    echo "You are currently in the Conda environment: $CURRENT_ENV"
else
    echo "You are NOT in any Conda environment."
fi

