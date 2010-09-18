#!/bin/bash
# toplog.sh | Curtis Free (http://curtisfree.com)
# Script to record `top` output on sequential runs.

if [[ $# -ne 2 ]]; then
    echo "usage: $0 <num_iterations> <delay>"
    exit 1
fi

for i in $(seq $1); do
    top -bn 1
    sleep $2
done

