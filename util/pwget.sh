#!/bin/bash

if [ $# -lt 2 ]; then
    echo "usage: $0 <command>"
    echo "All occurrences of \$pw will be replaced with your password."
    echo "NOTE: You must properly escape \$pw (usually '\$pw')."
    exit 1
fi

echo -n "Password: "
stty -echo
read pw
stty echo
echo

eval $*

