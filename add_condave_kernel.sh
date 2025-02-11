#!/bin/bash
JUPYTER_KERNEL_DIR=$HOME/.local/share/jupyter/kernels/ojk.condave
mkdir -p $JUPYTER_KERNEL_DIR
JUPYTER_KERNEL_FILE="$JUPYTER_KERNEL_DIR/kernel.json"

if [[ -f "kernel.condave.json" ]]; then
    cp kernel.condave.json "$JUPYTER_KERNEL_FILE"
else
    echo "kernel.condave.json not found."
    echo "Did you git clone the entire repository?"
    echo "git clone https://github.com/lsuhpchelp/ood-tut.git"
    echo "Exiting script."
    exit 1
fi

if [[ -f "$JUPYTER_KERNEL_FILE" ]]; then
    # Extract content within double quotes from line 8
    echo "kernel file is copied to:"
    echo "${JUPYTER_KERNEL_FILE}"
    echo "using the conda environment in:"
    LINE_CONTENT=$(sed -n '3s/.*"\(.*\)".*/\1/p' "$JUPYTER_KERNEL_FILE")
    #echo $LINE_CONTENT
    BEFORE_BIN=$(echo "$LINE_CONTENT" | sed 's|/bin.*||')
    echo "$BEFORE_BIN"
else
    echo "kernel.json copy failed, make sure you have write access to $JUPYTER_KERNEL_DIR."
fi

