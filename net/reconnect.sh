#!/bin/bash
# reconnect.sh | Curtis Free (http://curtisfree.com)
# Simple script for disconnecting from and reconnecting to all currently-connected networks.

# Must be root.
if [ `id -u` -ne 0 ]; then
    echo "Error! Must be root to reconnect to the network!"
    exit 2
fi

# For each profile currently up, disconnect and reconnect.
for profile in $(netcfg current); do
    netcfg -d ${profile}
    netcfg ${profile}
done
