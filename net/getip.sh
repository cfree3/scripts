#!/bin/sh
# getip.sh | Curtis Free (http://curtisfree.com)
# Retrieves and caches the current outward-facing IP.
# Thanks to DynDNS for hosting http://checkip.dyndns.com.

GETIP_FILE=/tmp/getip # Location of the IP cache file.

# If IP has been cached, display it.
if [[ -f ${GETIP_FILE} ]]; then
    cat ${GETIP_FILE}
    exit 0
fi

# Save/echo IP.
curl --silent checkip.dyndns.com | sed "s/^.*: \([0-9.]\+\).*$/\1/" | tee ${GETIP_FILE}
echo "STORED $(date) (delete ${GETIP_FILE} to reset)" >> ${GETIP_FILE}

