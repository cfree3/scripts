#!/usr/bin/env python3
# randesk.py | Curtis Free (http://curtisfree.com)
# Sets desktop wallpaper to a random image.
#
# Some references:
# ----------------
# http://conditionallogic.blogspot.com/2009/11/set-wallpaper-using-imagemagicks.html
# http://www.linux.com/archive/articles/51567
# http://wiki.archlinux.org/index.php/Openbox
# http://www.gentoo-wiki.info/Openbox
# http://www.gentoo-wiki.info/Xorg_X11_and_Transparency#xcompmgr_compatibility_with_xsetbg

from os import environ,listdir,sep,system
from random import choice

wall_dir = environ['HOME'] + sep + '.walls/' # directory containing images
walls = listdir(wall_dir)                    # list of all available wallpaper

# set the wallpaper
system('nitrogen --set-scaled ' + wall_dir + choice(walls))

