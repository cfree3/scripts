#!/bin/sh
# disabledpms.sh | Curtis Free (http://curtisfree.com)
# Simple script to continuously disable DPMS at a given interval.
# Useful if another script/cron job is setting DPMS

INTERVAL="20s" # Should be shorter than lowest DPMS timeout interval.

# Continuously disable DPMS.
while true; do
    xset -dpms
    sleep ${INTERVAL}
done

