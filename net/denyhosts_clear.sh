#!/bin/bash
# denyhosts_clear.sh | Curtis Free (http://curtisfree.com)
# Clears all IPs blocked by DenyHosts.
# See http://denyhosts.sourceforge.net/faq.html#3_19.

DENYHOSTS=/etc/rc.d/denyhosts # Location of DenyHosts script.
WORK_DIR=/var/lib/denyhosts   # Specified in DenyHosts conf.

# Ensure that the user is root (or running as root).
if [ `id -u` -ne 0 ]; then
    echo "Error! Must be root to run $0."
    exit 1
fi

# Stop DenyHosts.
$DENYHOSTS stop

# Remove the blocked hosts.
echo -n >/etc/hosts.evil

# Remove entries for all hosts from DenyHosts's files.
echo -n >${WORK_DIR}/hosts
echo -n >${WORK_DIR}/hosts-restricted
echo -n >${WORK_DIR}/hosts-root
echo -n >${WORK_DIR}/hosts-valid
echo -n >${WORK_DIR}/user-hosts

# Start DenyHosts.
$DENYHOSTS start

