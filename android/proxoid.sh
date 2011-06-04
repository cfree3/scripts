#!/bin/bash
# proxoid.sh | Curtis Free (http://curtisfree.com)
# Simple script to automate Proxoid setup.
# Setup steps from https://code.google.com/p/proxoid/wiki/installationLinux.

ADB=adb
PROXY_PORT=8080

${ADB} devices

echo "Is your device listed?"
echo "If not, exit now. Otherwise, continue."
read

${ADB} forward tcp:${PROXY_PORT} tcp ${PROXY_PORT}

echo "Finally, set your browser to use HTTP proxy on localhost:8080."

