# Repository Files Overview

## For adding a Jupyter kernel using a conda environment

- **setup_condave_default_path.sh**: Script to create a conda environments named "myenv" using the default path (in $HOME/.conda/envs).
- **setup_condave_prefix.sh**: Script to set up a specific prefix (non-default path) for a Conda environment named "myenv".
- **check_numpy_condave.sh**: Script to verify the installation of NumPy within a Conda environment.
- **check_numpy_singularity.sh**: Script to check the presence of NumPy inside a Singularity container.
- **remove_condave_default_path.sh**: Script to remove the default path settings for a Conda environment.
- **remove_condave_prefix.sh**: Script to unset the Conda environment prefix.


### How to use

```bash
git clone https://github.com/lsuhpchelp/ood-tut.git
cd ood-tut
# create a conda environment named "myenv" using the default path in $HOME/.conda/envs
./setup_condave_default_path.sh
#create a conda environment named "myenv" under a specific prefix, which uses the current directory by default.
./setup_condave_prefix.sh 
# If you need to remove the created conda environments, source the below scripts (note that they need to be sourced instead of run under a sub-shell):
# remove the conda environment "myenv" in $HOME/.conda/envs
source remove_condave_default_path.sh
# remove the conda environment "myenv" using the prefix, which uses the current directory by default.
source remove_condave_prefix.sh 
```

## For adding a Jupyter kernel using a singularity image

- **add_singularity_kernel.sh**: Script to add a Jupyter kernel that utilizes a Singularity container to the Jupyter Notebook launcher.
- **remove_singularity_kernel.sh**: Script to remove a previously added Singularity-based Jupyter kernel.
- **kernel.singularity.json**: JSON configuration file for setting up a Jupyter kernel that runs within a Singularity container.
- **own.jupyter.kernel.def**: Definition file for building a custom Jupyter kernel within a Singularity container.
- **split_sif.sh**: Script to split a large Singularity Image File into smaller parts for easier distribution.
- **merge_sif.sh**: Script to merge split Singularity Image Files (.sif) into a single image.
- **ojk.np.sif.part-0** & **ojk.np.sif.part-1**: Parts of a split Singularity Image File, intended to be merged for use.

### How to use
```bash
# If you want to build the singularity image, you need to clone the repository to your local machine, which you have root access:
sudo singularity build ojk.np.sif own.jupyter.kernel.def
# copy the image to the cluster
scp ojk.np.sif <user>@qbd.loni.org:/home/<user>/<path_on_cluster>
```

```bash
#For the current tutorial, the singularity image is prepared for you in the github repository.
# Use the below script to prepare the image file so you don’t need to build the image by yourself:
git clone https://github.com/lsuhpchelp/ood-tut.git
cd ood-tut
cat ojk.np.sif.part-* > ojk.np.sif
# This is required for running the singularity image on LONI HPC clusters
chgrp singularity ojk.np.sif
# Add the Jupyter kernel that utilizes ojk.np.sif container image to the Jupyter Notebook launcher
./add_singularity_kernel.sh
# Remove a previously added Singularity-based Jupyter kernel.
./remove_singularity_kernel.sh 
```

## For Matlab OOD demo

- **curve_data.txt**: Data file containing x and y coordinates for plotting purposes.
- **plotxy.m**: MATLAB script designed to plot data from 'curve_data.txt'.
