#!/bin/bash
JUPYTER_KERNEL_DIR=$HOME/.local/share/jupyter/kernels/ojk.singularity
mkdir -p $JUPYTER_KERNEL_DIR
JUPYTER_KERNEL_FILE="$JUPYTER_KERNEL_DIR/kernel.json"

if [[ -f "kernel.singularity.json" ]]; then
    cp kernel.singularity.json "$JUPYTER_KERNEL_FILE"
else
    echo "kernel.singularity.json not found."
    echo "Did you git clone the entire repository?"
    echo "git clone https://github.com/lsuhpchelp/ood-tut.git"
    echo "Exiting script."
    exit 1
fi

# replace the image_dir with the path of the image "ojk.np.sif"
sed -i "s|/image_dir/|$(pwd)/|g" $JUPYTER_KERNEL_FILE

if [[ -f "$JUPYTER_KERNEL_FILE" ]]; then
    # Extract content within double quotes from line 8
    echo "kernel file is copied to:"
    echo "${JUPYTER_KERNEL_FILE}"
    echo "using the singularity image:"
    sed -n '8s/.*"\(.*\)".*/\1/p' "$JUPYTER_KERNEL_FILE"
else
    echo "kernel.json copy failed, make sure you have write access to $JUPYTER_KERNEL_DIR."
fi

