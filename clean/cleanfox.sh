#!/bin/bash
# cleanfox.sh | Curtis Free (http://curtisfree.com)
# This script is used to clear the cookies, form history, and browser history
# for Mozilla Firefox. A set of "clean" data files must be stored in a
# subdirectory of the profile directory (see the commands below for additional
# details.

PROFILE="3biy2zwz" # The Firefox profile name/ID.

FFPATH=$HOME/.mozilla/firefox/$PROFILE.default # The profile path.

# Clear cookies.
rm -f $FFPATH/cookies.sqlite

# Clear form history.
rm -f $FFPATH/formhistory.sqlite

# Clear "places" store.
#rm -f $FFPATH/places.sqlite # Uncommenting will restore "dynamic" bookmark folders.
rm -f $FFPATH/places.sqlite-journal

# Clear "favorite" tags.
rm -f $FFPATH/favoriteTags.txt

# Remove bookmarks backup and backups directory.
rm -rf $FFPATH/bookmarkbackups

# Clear the cache.
#rm -rf $FFPATH/Cache
rm -rf /dev/shm/firefox-cache/Cache

# Remove the extensions cache.
rm -f $FFPATH/extensions.cache # Will also cause loss of compatibility updates.

# Remove record of downloads.
rm -f $FFPATH/downloads.sqlite

# Remove AdBlock Plus pattern backups.
rm -f $FFPATH/adblockplus/patterns-backup*.ini

# Remove security certificates.
rm -f $FFPATH/cert8.db

# Remove stored session.
rm -f $FFPATH/sessionstore*.js

# Remove the compatibility info file.
rm -f $FFPATH/compatibility.ini

# Remove the parent lock.
rm -f $FFPATH/.parentlock

# Remove offline content.
rm -rf $FFPATH/OfflineCache

# Remove signon information.
rm -f $FFPATH/signons.sqlite

# Remove URL classifier information.
rm -f $FFPATH/urlclassifier3.sqlite

# Remove webapp data.
rm -f $FFPATH/webappsstore.sqlite

# Remove preferences backups.
rm -f $FFPATH/prefs-*.js

# Remove local data storage.
rm -f $FFPATH/localstore.rdf

# Remove Vimperator data.
rm -rf $HOME/.vimperator

