#!/bin/bash
# cleangconf.sh | Curtis Free (http://curtisfree.com)
# This script is used to clean unnecessary GNOME configuration files from
# the user's home directory.

# Assemble an array of ~/.gconf files/subdirectories to remove.
GCONF_FILES=( 'apps/baobab'                  # Baobab ("Disk Usage Analyzer")
              'apps/blackjack'               # Blackjack
              'apps/eog'                     # Eye of Gnome ("Image Viewer")
              'apps/file-roller'             # File Roller ("Archive Manager")
              'apps/gcalctool'               # Gcalctool ("Calculator")
              'apps/gconf-editor'            # GNOME Configuration Editor
              'apps/gedit-2'                 # Gedit
              'apps/gnome-dictionary'        # GNOME Dictionary
              'apps/gnome-screenshot'        # GNOME Screenshot
              'apps/gnome-search-tool'       # GNOME Search
              'apps/gnome-session'           # GNOME Session
              'apps/gnome-settings'          # Miscellaneous (Settings)
              'apps/gnome-volume-control/ui' # Volume Control UI
              'apps/gucharmap'               # Gucharmap ("Character Map")
              'apps/nautilus-cd-burner'      # Nautilus CD Burner
              'apps/procman' )               # GNOME System Monitor

# Assemble an array of ~/.gnome2 files/subdirectories to remove.
GNOME2_FILES=( 'accels'               # Hotkeys
               'accelsgedit'          # Gedit Hotkeys
               'blackjack.d'          # Blackjack
               'eog'                  # Eye of Gnome ("Image Viewer")
               'file-roller'          # File Roller ("Archive Manager")
               'gedit*'               # Gedit (Settings)
               'glchess'              # glChess
               'gnome-dictionary'     # GNOME Dictionary
               'gnome-power-manager'  # GNOME Power Manager
               'gnome-volume-control' # GNOME Volume Control
               'main'                 # Placement Settings
               'nautilus-scripts'     # Nautilus (Scripts Directory)
               'sound'                # Custom Sounds
               'share'                # Font Directories
               'Totem'                # Totem (Settings)
               'yelp' )               # Yelp ("Help" Browser)

# Remove each of the ~/.gconf subdirectories specified above.
for gconf_file in ${GCONF_FILES[@]}; do
    rm -rf $HOME/.gconf/$gconf_file
done

# Remove each of the ~/.gnome2 files/subdirectories specified above.
for gnome2_file in ${GNOME2_FILES[@]}; do
    rm -rf $HOME/.gnome2/$gnome2_file
done

