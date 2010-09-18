#!/bin/bash
# calendar.sh | Curtis Free (http://curtisfree.com)
# This script opens a simple calendar in an xterm.

# If given --toggle, close an open calendar or open a new one.
if [ "$1" = "--toggle" ]; then

    # Get the PID for the existing calendar instance.
    pid=$(ps aux | grep "xterm -T Calendar" | grep -v grep | sed "s/$USER \+\([0-9]\+\) \+.*$/\1/")

    # If there is a PID, kill the existing instance.
    if [ "$pid" != "" ]; then
        kill $pid
        exit $?   # Exit with kill's exit status.

    # Otherwise, "eat" the --toggle flag.
    else
        shift
    fi
fi

# Show the calendar.
xterm -T "Calendar" -geometry "20x9" -e bash -c \
'cal && read DATE && while [[ $DATE != "" ]]; do cal $DATE; read DATE; done'

