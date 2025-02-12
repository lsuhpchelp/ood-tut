#!/bin/bash
JUPYTER_KERNEL_DIR=$HOME/.local/share/jupyter/kernels/ojk.singularity
echo "Removing folder $JUPYTER_KERNEL_DIR"
rm -rf $JUPYTER_KERNEL_DIR
