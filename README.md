# VM Cloning Automation Script

This repository contains a shell script for automating the process of cloning a KVM VM. The script performs the following tasks:
1. Converts a base image to QCOW2 format.
2. Dumps the XML configuration of the original VM.
3. Clones the VM using the new QCOW2 image and the dumped XML configuration.

## Script Overview

The script, `clone_vm.sh`, takes three arguments:
- `<base>`: Path to the base image file (e.g., `base.qcow2`).
- `<name>`: Name of the original VM to dump the XML configuration from.
- `<goal>`: Name of the new VM to be created.

### Prerequisites

- `qemu-img`: Required for converting image formats.
- `virsh`: Required for dumping and managing VM XML configurations.
- `virt-clone`: Required for cloning VMs.

Ensure these tools are installed on your system. On Debian-based systems