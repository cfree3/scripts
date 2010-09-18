#!/bin/sh
# dmenu_wrapper.sh | Curtis Free (http://curtisfree.com)
# Simple script to wrap dmenu.
#
# NOTE: If XFT installed, requires dmenu compiled with XFT support.
#
# BEWARE! dmenu + dmenu_wrapper can be dangerous!
# -----------------------------------------------
# With dmenu and this wrapper script, executing something like `ls` can
# unknowningly execute noxious scripts or commands!
#
# References
# ----------
# http://urukrama.wordpress.com/2008/02/07/using-dmenu-in-pekwm-and-openbox/
# http://ubuntuforums.org/showthread.php?t=642808
# http://bbs.archlinux.org/viewtopic.php?id=43802

# Choose the proper font.
## Placing both the flag and the specifier in one var is not interpreted properly.
if which xft-config &>/dev/null; then
    FONT_FLAG='-fa'
    FONT='Bitstream Vera Sans-10'
else
    FONT_FLAG='-fn'
    FONT='-*-bitstream vera sans-*-r-*-*-10-*-*-*-*-*-*-*'
fi

exec `dmenu_path | dmenu -b $FONT_FLAG "$FONT" -nb white -nf black -p '% ' -sb '#3465A4' -sf white`

