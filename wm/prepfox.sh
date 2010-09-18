#!/bin/sh
# prepfox.sh | Curtis Free (http://curtisfree.com)
# Simple script to "prepare" a new Firefox profile.

# Check arguments.
if [ $# != 1 ]; then
    echo "usage: $0 <Firefox version number>"
    exit 1
fi

# Set up params.
FF_VERSION=$1 ; shift

# Ensure that a profile has been created; then, get the profile name from the user.
echo "First, start and immediately exit Firefox. Hit <Enter> when complete." && read
echo "Now, check ${HOME}/.mozilla/firefox and get the name of your profile ('something.default')."
echo -ne "\tEnter the name of that profile here: " && read FF_PROFILE && echo

# Build filename.
FF_PREFS_FILE=${HOME}/.mozilla/firefox/${FF_PROFILE}.default/prefs.js

# Function to set preferences.
fix_pref() { # fix_pref <pref> <value>
    echo "user_pref(\"${1}\", ${2});" >> ${FF_PREFS_FILE}
}

# Set the preferences.
echo -n "Setting preferences..."
    fix_pref browser.cache.disk.capacity                        10000;
    fix_pref browser.cache.memory.capacity                      18432;
    fix_pref browser.download.manager.showAlertOnComplete       false;
    fix_pref browser.download.manager.showWhenStarting          false;
    fix_pref browser.download.useDownloadDir                    false;
    fix_pref browser.history_expire_days.mirror                 180;
    fix_pref browser.history_expire_days_min                    3;
    fix_pref browser.tabs.insertRelatedAfterCurrent             true;
    fix_pref browser.rights.3.shown                             true;
    fix_pref browser.safebrowsing.enabled                       false;
    fix_pref browser.safebrowsing.malware.enabled               false;
    fix_pref browser.startup.homepage                           \"file://${HOME}/start/index.html\";
    fix_pref browser.tabs.warnOnClose                           false;
    fix_pref dom.disable_window_move_resize                     true;
    fix_pref general.useragent.extra.firefox                    \"Firefox/${FF_VERSION}\";
    fix_pref layout.spellcheckDefault                           0;
    fix_pref middlemouse.contentLoadURL                         false;
    fix_pref mousewheel.horizscroll.withnokey.action            1;
    fix_pref network.cookie.cookieBehavior                      1;
    fix_pref network.cookie.lifetimePolicy                      2;
    fix_pref network.dns.disableIPv6                            true;
    fix_pref network.http.max-connections                       48;
    fix_pref network.http.max-connections-per-server            16;
    fix_pref network.http.max-persistent-connections-per-server 8;
    fix_pref network.http.pipelining                            true;
    fix_pref network.http.pipelining.maxrequests                8;
    fix_pref network.image.imageBehavior                        0;
    fix_pref network.prefetch-next                              true;
    fix_pref network.proxy.socks                                \"localhost\";
    fix_pref network.proxy.socks_port                           8080;
    fix_pref network.proxy.socks_remote_dns                     true;
    fix_pref network.proxy.type                                 0;
    fix_pref nglayout.initialpaint.delay                        100;
    fix_pref privacy.clearOnShutdown.offlineApps                true;
    fix_pref privacy.clearOnShutdown.passwords                  true;
    fix_pref privacy.clearOnShutdown.siteSettings               true;
    fix_pref privacy.cpd.cookies                                false;
    fix_pref privacy.sanitize.sanitizeOnShutdown                true;
    fix_pref security.default_personal_cert                     \"Select\ Automatically\";
    fix_pref security.warn_viewing_mixed                        false;
    fix_pref signon.rememberSignons                             false;
    fix_pref ui.submenuDelay                                    25;
    fix_pref xpinstall.whitelist.add                            \"\";
    fix_pref xpinstall.whitelist.add.36                         \"\";
echo " done."

echo

# Tell the user what's left to do.
echo "Now you have some work to do!"
echo -e "\t1) Go through Firefox's preferences menu and set prefs as desired."
echo -e "\t2) Import old bookmarks."
echo -e "\t3) Install and configure the following extensions, in this order:"
echo -e "\t\tNoScript      (http://noscript.net/) [OPTIONAL]"
echo -e "\t\tAdblock Plus  (http://adblockplus.org/en/)"
echo -e "\t\tWeb Developer (http://chrispederick.com/work/web-developer/)"
echo -e "\t\tVimperator    (http://vimperator.org/vimperator)"

