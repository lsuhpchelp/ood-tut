#!/bin/bash

# Check if the script is sourced or executed
# https://stackoverflow.com/questions/2683279/how-to-detect-if-a-script-is-being-sourced
(return 0 2>/dev/null) && sourced=1 || sourced=0
if [[ "$sourced" == "0" ]]; then
    echo "This script is being run directly."
    echo "Please source this script instead:"
    echo ""
    echo "source remove_myenv.sh"
    echo ""
    exit 1
fi

module load python

# Get the name of the currently active Conda environment
CURRENT_ENV=$(conda info --envs | awk '$1 ~ /^\*/ {print $1}' | sed 's/*//')

# Check if 'myenv' exists before attempting to remove it
echo "Check if 'myenv' exists..."
if conda info --envs | grep -q "$PWD/myenv"; then
    echo "Conda environment '$PWD/myenv' exists..."
    # If currently in 'myenv', deactivate it
    if [[ "$CONDA_DEFAULT_ENV" == "$PWD/myenv" ]]; then
        echo "You are currently in 'myenv'. Deactivating..."
        conda deactivate
        echo "'myenv' has been deactivated."
    fi
    #if [[ "$CURRENT_ENV" == "myenv" ]]; then
    #    echo "You are currently in 'myenv'. Deactivating..."
    #    conda deactivate
    #    echo "'myenv' has been deactivated."
    #fi

    # Remove the 'myenv' Conda environment
    echo "Removing Conda environment '$PWD/myenv'..."
    #conda env remove --name myenv
    conda env remove --prefix "$PWD/myenv"
    echo "'myenv' has been removed."
else
    echo "Conda environment 'myenv' does not exist. No action taken."
fi

