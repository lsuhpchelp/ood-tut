#!/bin/bash

singularity exec ./ojk.np.sif python3 -c "import numpy; print('NumPy in singularity version:', numpy.__version__)"
