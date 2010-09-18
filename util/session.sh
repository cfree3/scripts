#!/bin/sh
# session.sh | Curtis Free (http://curtisfree.com)
# Simple script for performing end-of-session tasks.

# Commands.
CMD_CLEAN="metaclean"
CMD_LOGOUT="logout"
CMD_REBOOT="sudo shutdown -r now"
CMD_SHUTDOWN="sudo shutdown -h now"

# Helper function to print helper information (to stderr).
function show_usage() { echo "usage: $0 [-c] [logout|reboot|shutdown]"; }

# Argument check.
if [[ $# < 1 ]]; then
    show_usage >&2
    exit 1
fi

# Clean, if requested.
if [ $1 == '-c' ]; then ${CMD_CLEAN}; shift; fi
if [[ $# -eq 0 ]]; then exit; fi # Exit if nothing else to do.

# Perform the task.
case $1 in
    logout)
        eval ${CMD_LOGOUT}
        ;;
    reboot)
        eval ${CMD_REBOOT}
        ;;
    shutdown)
        eval ${CMD_SHUTDOWN}
        ;;
    *)
        show_usage >&2
        exit 1
        ;;
esac

