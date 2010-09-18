#!/bin/bash
# metaclean.sh | Curtis Free (http://curtisfree.com)
# This script is used to perform various system cleaning tasks.

CLEAN_SCRIPTS_DIR=$HOME/scripts/clean # This directory contains the clean scripts.

# Clean VirtualBox logs.
$CLEAN_SCRIPTS_DIR/cleanvmlogs.sh

# Clean Firefox data.
$CLEAN_SCRIPTS_DIR/cleanfox.sh

# Clean Pidgin data.
$CLEAN_SCRIPTS_DIR/cleanpidgin.sh

# Clean specific GNOME settings.
$CLEAN_SCRIPTS_DIR/cleangconf.sh

# Clean the home directory.
$CLEAN_SCRIPTS_DIR/cleanhome.sh

