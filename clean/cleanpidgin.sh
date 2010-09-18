#!/bin/bash
# cleanpidgin.sh | Curtis Free (http://curtisfree.com)
# This script is used to clean several files and directories used by Pidgin.
# ~/.purple directory used by Pidgin.

# Clear the buddy icon cache.
rm -rf $HOME/.purple/icons

# Remove the accels file.
rm -f $HOME/.purple/accels

# Remove certificates.
rm -rf $HOME/.purple/certificates

# Delete the status file.
rm -f $HOME/.purple/status.xml

# Clear all buddy pounces.
rm -f $HOME/.purple/pounces.xml

