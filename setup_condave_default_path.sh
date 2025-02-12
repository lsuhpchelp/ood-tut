#!/bin/bash

# Load Python module (adjust as needed for your system)
module load python

# Create Conda environment named "myenv" if it doesn't exist
if ! conda info --envs | grep -q "^myenv "; then
    echo "Creating Conda environment 'myenv'..."
    conda create -y --name myenv python=3.10  # Adjust Python version if needed
    #conda create -y --prefix=$PWD/myenv python=3.10  # Adjust Python version if needed
else
    echo "Conda environment 'myenv' already exists. Skipping creation."
fi

# Activate the Conda environment
source activate myenv
#conda install ipykernel
#python -m ipykernel install --user --name myenv --display-name "Python (myenv)"

# Install numpy version 2.0.0 and ipykernel
echo "Installing numpy 2.0.0 and ipykernel..."
pip install numpy==2.0.0 
pip install ipykernel #--display-name "Python (My Environment)" 

# Verify installation
echo "Installed package versions:"
python -c "import numpy; print('numpy version:', numpy.__version__)"
python -c "import ipykernel; print('ipykernel installed successfully')"

echo "Setup complete."

