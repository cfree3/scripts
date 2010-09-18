#!/bin/bash
# llmp.sh | Curtis Free (http://curtisfree.com)
# This script starts the LLMP (Linux, Lighttpd, MySQL, PHP) web server components.
# For this script to function properly, it should be run as root.

if [ $UID != 0 ]; then
    echo "$0 must be run as root"
    exit 1
fi

LLMP_COMPONENTS=( '/etc/rc.d/mysqld'
                  '/etc/rc.d/lighttpd' )

case "$1" in
    start|stop|restart)
        for component in ${LLMP_COMPONENTS[@]}; do
            $component $1
        done
        ;;
    *)
        echo "usage: $0 {start|stop|restart}"
        exit 1
esac

