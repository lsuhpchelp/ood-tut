#!/bin/bash

# Activate the Conda environment
source $(conda info --base)/etc/profile.d/conda.sh
conda activate myenv

# Check if activation was successful
if [[ $? -ne 0 ]]; then
    echo "Error: Conda environment 'myenv' not found or could not be activated."
    exit 1
fi

# Get NumPy version
NUMPY_VERSION=$(python -c "import numpy; print(numpy.__version__)" 2>/dev/null)

# Check if NumPy is installed
if [[ $? -ne 0 ]]; then
    echo "NumPy is not installed in the 'myenv' environment."
    exit 1
else
    echo "NumPy version in 'myenv': $NUMPY_VERSION"
fi

