#!/bin/bash
# checkweberr.sh | Curtis Free (http://curtisfree.com)
# This script continually checks a web/network resource for errors until it is accessed
# successfully.

# If an incorrect number of arguments were given, inform the user and exit.
if [ $# != 2 ]; then
    echo "Usage: $0 URL DELAY"
    exit 1
fi

# Attempt to change to the /tmp directory.
cd /tmp || exit 1

# Make an initial attempt to access the resource.
wget -q $1

# Continue attempting to access the resource until successful.
while [ $? != '0' ]; do
    echo "`date +%c` -> ERROR"
    sleep $2
    wget -q $1
done

# Inform the user that there was no error when accessing the specified resource.
echo "`date +%c` -> NO ERROR"

