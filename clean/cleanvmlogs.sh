#!/bin/bash
# cleanvmlogs.sh | Curtis Free (http://curtisfree.com)
# This script is used to remove all Virtualbox logs for a list of machines.

MACHINE_DIR=$HOME/.VirtualBox/Machines # This is the machine directory.
MACHINES=('WinXP') # This is an array of machine names.

# Remove all logs from the home directory.
rm -f $HOME/*-VirtualBox-*.log

# Remove all machine logs.
for machine in ${MACHINES[@]}; do
    rm -rf $MACHINE_DIR/$machine/Logs/*
done

