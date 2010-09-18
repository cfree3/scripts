#!/bin/bash
# cleanhome.sh | Curtis Free (http://curtisfree.com)
# This script is used to clear some unnecessary files from the user's home
# directory.

# Clear recent Vim info.
rm -f $HOME/.viminfo

# Clear log of X session errors.
rm -f $HOME/.xsession-errors

# Clear recently-used lists.
rm -f $HOME/.recently-used
rm -f $HOME/.recently-used.xbel

# Clear BASH history record.
rm -f $HOME/.bash_history

# Clear zsh history record.
rm -f $HOME/.zsh_history

# Remove zsh completion dump file.
rm -f $HOME/.zcompdump

# Clear less history file.
rm -f $HOME/.lesshst

# Clear Nautilus error log.
rm -f $HOME/nautilus-debug-log.txt

# Clear DVD decoding logs.
rm -rf $HOME/.dvdcss

# Clear Flash local storage.
rm -rf $HOME/.adobe
rm -rf $HOME/.macromedia

# Clear Java cache/logs.
rm -rf $HOME/.java

# Clear Nautilus thumbnails.
rm -rf $HOME/.thumbnails

# Clear Nautilus files.
rm -rf $HOME/.nautilus

# Clear Metacity saved sessions.
rm -rf $HOME/.metacity

# Clear KchmViewer files.
rm -rf $HOME/.kchmviewer

# Clear Qt files.
rm -rf $HOME/.qt

# Clear display manager configuration.
rm -f $HOME/.dmrc

# Clear ESD file.
rm -f $HOME/.esd_auth

# Remove GKSu lock file.
rm -f .gksu.lock

# Clear GNOME GTK configuration file
rm -f .gtkrc-1.2-gnome2

# Clear some GTK settings.
rm -rf $HOME/.config/gtk-2.0

# Clear some Totem settings.
rm -rf $HOME/.config/totem

# Clear pcmanfm settings.
rm -rf $HOME/.config/pcmanfm

# Clear medit config file.
rm -f $HOME/.config/meditrc

# Clear SSH configuration/hosts files.
#rm -rf $HOME/.ssh

# Remove a standard GNOME settings directory.
rm -rf $HOME/.gnome

# Remove GNOME private directory.
rm -rf $HOME/.gnome2_private

# Remove xine directory.
rm -rf $HOME/.xine

# Remove Evince configuration files.
rm -rf $HOME/.config/evince

# Remove font cache files.
rm -rf $HOME/.fontconfig

# Clear GIMP (2.4) information.
rm -rf $HOME/.gimp-2.4

# Clear CDDB information.
rm -rf $HOME/.cddb*

# Remove GStreamer files.
rm -rf $HOME/.gstreamer-0.10

# Remove the GVFS directory.
rm -rf $HOME/.gvfs

# Remove the per-user icons directory.
rm -rf $HOME/.icons

# Remove Inkscape configuration files.
rm -rf $HOME/.inkscape

# Remove htop configuration file.
rm -f $HOME/.htoprc

# Remove local menu configuration files.
rm -rf $HOME/.local

# Remove unneeded getmail files.
rm -f $HOME/.getmail/oldmail*

# Remove Dia configuration directory.
rm -rf $HOME/.dia

# Remove MySQL history.
rm -f $HOME/.mysql_history

# Remove PHP history.
rm -f $HOME/.php_history

# Clear gmrun history.
rm -f $HOME/.gmrun_history

# Clear GTK bookmarks.
rm -f $HOME/.gtk-bookmarks

# Remove dbus directory.
rm -rf $HOME/.dbus

# Remove mplayer directory.
rm -rf $HOME/.mplayer

# Remove the galculator settings file.
rm -f $HOME/.galculator

# Remove lftp settings.
rm -rf $HOME/.lftp

# Clear cache.
rm -rf $HOME/.cache

# Clear Trolltech (Qt) conf.
rm -f $HOME/.config/Trolltech.conf

# Clear GXINE config.
rm -rf $HOME/.config/gxine

# Clear EPDFView config.
rm -rf $HOME/.config/epdfview

# Clear GPicView config.
rm -rf $HOME/.config/gpicview

# Clear Mirage config.
rm -rf $HOME/.config/mirage

# Remove SQLite history.
rm -f $HOME/.sqlite_history

# Remove history of GNT window positions.
rm -f $HOME/.gntpositions

# Remove clamz files.
rm -rf $HOME/.clamz

# Remove psql history.
rm -f $HOME/.psql_history

# Remove some Vimperator files.
rm -rf $HOME/.vimperator

# Remove GNOME files.
rm -rf $HOME/.gnome2

# Remove GConf daemon files.
rm -rf $HOME/.gconfd

