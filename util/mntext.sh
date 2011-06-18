#!/bin/bash
# mntext.sh | Curtis Free (http://curtisfree.com)
# Mounts an external HD; assumes device and FS type (see "Settings").

# References
# ----------
# http://www.linuxquestions.org/questions/linux-newbie-8/cannot-change-file-permissions-on-a-mounted-file-system-800469/
# http://en.wikipedia.org/wiki/Fstab
# http://serverfault.com/questions/43634/how-to-mount-external-vfat-drive-as-user
# http://ubuntuforums.org/showthread.php?t=138195
# http://my.opera.com/lounge/forums/topic.dml?id=83440

# Settings.
DEVICE=/dev/sdb1
TYPE='vfat'

# Get the user-specified label (might or might not be the actual drive label).
if [ -z "${1}" ]; then
    echo "Error! Must specify label."
    exit 2
fi
LABEL="${1}"

# Must be root.
if [ `id -u` -ne 0 ]; then
    echo "Error! Must be root to mount external disk!"
    exit 2
fi

# Ensure that the device exists.
if ! [ -b ${DEVICE} ]; then
    echo "Error! ${DEVICE} does not exist or is not a block device!"
    exit 2
fi

# Ensure that the mount dir exists.
mkdir -p /media/${LABEL}

# Do the mount.
mount -t ${TYPE}  -o noauto,rw,nosuid,nodev,nouser,uid=1000,gid=1000,umask=0007 ${DEVICE} /media/${LABEL}

