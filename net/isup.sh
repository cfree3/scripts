#!/bin/sh
# isup.sh | Curtis Free (http://curtisfree.com)
# Simply tests to see if a website is up (i.e., responding to pings).

# Argument check.
if [[ "$#" -ne 1 ]]; then
    echo "usage: $0 host"
fi

# Attempt to ping the host.
ping -c1 $1 &>/dev/null

# Echo the appropriate message.
if [[ "$?" -eq 0 ]]; then
    echo "up"
else
    echo "down"
fi

