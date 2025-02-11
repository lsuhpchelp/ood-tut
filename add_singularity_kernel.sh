#!/bin/bash
JUPYTER_KERNEL_DIR=~/.local/share/jupyter/kernels/ojk.sigularity
mkdir -p $JUPYTER_KERNEL_DIR
cp kernel.json $JUPYTER_KERNEL_DIR/

JUPYTER_KERNEL_FILE="$JUPYTER_KERNEL_DIR/kernel.json"

if [[ -f "$JUPYTER_KERNEL_FILE" ]]; then
    # Extract content within double quotes from line 8
    echo "kernel file is copied to:"
    echo "${JUPYTER_KERNEL_FILE}"
    echo "using the singularity image:"
    sed -n '8s/.*"\(.*\)".*/\1/p' "$JUPYTER_KERNEL_FILE"
else
    echo "kernel.json copy failed, make sure kernel.json is in the current directory."
fi

