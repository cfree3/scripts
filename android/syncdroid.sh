#!/bin/zsh
# syncdroid.sh | Curtis Free (http://curtisfree.com)
# Simple script to sync one's music with an Android device.

# Android information.
DROID_NAME=CF-Droid

# Filesystem locations.
SYNC_SRC=/media/CF-ExHD/Music
MNT_DIR=/media

# Excluded files (e.g., iTunes music).
SYNC_EXCLUDES='*.m4p'

# Build path to the destination.
music_dir=${MNT_DIR}/${DROID_NAME}/Music

# Ensure that the music dir exists and sync.
mkdir -p ${music_dir}
rsync -avm --progress --delete --exclude ${SYNC_EXCLUDES} ${SYNC_SRC}/* ${music_dir}

