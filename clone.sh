#!/bin/bash

# Check if the correct number of arguments is provided
if [ "$#" -ne 3 ]; then
    echo "Usage: $0 <base> <name> <goal>"
    exit 1
fi

# Assign arguments to variables
BASE="$1"
NAME="$2"
GOAL="$3"

# Convert the base image to qcow2 format
qemu-img convert -O qcow2 "$BASE" "$GOAL.qcow2"

# Dump the XML configuration of the base VM
sudo virsh dumpxml "$NAME" > "$GOAL.xml"

# Clone the VM using the new image and XML configuration
virt-clone --original-xml="$GOAL.xml" -f "$GOAL.qcow2" -n "$GOAL" --preserve-data

rm "$GOAL.xml"

