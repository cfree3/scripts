#!/usr/bin/env python
# sessionDialog.py | Curtis Free (http://curtisfree.com)
# This script displays a dialog that allows the user to clean (run a
# cleanup script and exit Openbox), log out (exit Openbox), reboot the
# computer (via GDM), or shutdown the computer (also via GDM).
#
# Most of this script is taken from:
# http://crunchbang.org/archives/2008/04/01/openbox-logout-reboot-and-shutdown-script/

import pygtk,gtk,os
pygtk.require('2.0')

class SessionDialog:

    # Cancel -> Close the dialog.
    def delete_event(self, widget, event, data=None):
        gtk.main_quit()
        return False

    # Clean -> Run the clean script.
    def logout_clean(self, widget):
        os.system(os.environ['HOME'] + "/scripts/clean/metaclean.sh")

    # Logout -> Exit Openbox.
    def logout(self, widget):
        os.system("openbox --exit")

    # Reboot -> Reboot the computer.
    def reboot(self, widget):
        os.system("sudo shutdown -r now && openbox --exit")

    # Shutdown -> Shutdown the computer.
    def shutdown(self, widget):
        os.system("sudo shutdown -h now && openbox --exit")

    def __init__(self):

        # Create the window and set various window aspects.
        self.window = gtk.Window(gtk.WINDOW_TOPLEVEL)
        self.window.set_title("Session Options")
        self.window.set_resizable(False)
        self.window.set_position(1)
        self.window.connect("delete_event", self.delete_event)
        self.window.set_border_width(0)

        # Create a box to hold the option buttons.
        self.box = gtk.HBox(False, 0)
        self.window.add(self.box)

        # Create the "Cancel" button.
        self.button0 = gtk.Button("Cancel")
        self.button0.set_border_width(10)
        self.button0.connect("clicked", self.delete_event, "No action taken.")
        self.box.pack_start(self.button0, True, True, 0)
        self.button0.show()

        # Create the "Clean" button.
        self.button1 = gtk.Button("Clean")
        self.button1.set_border_width(10)
        self.button1.connect("clicked", self.logout_clean)
        self.box.pack_start(self.button1, True, True, 0)
        self.button1.show()

        # Create the "Log Out" button.
        self.button2 = gtk.Button("Log Out")
        self.button2.set_border_width(10)
        self.button2.connect("clicked", self.logout)
        self.box.pack_start(self.button2, True, True, 0)
        self.button2.show()

        # Create the "Reboot" button.
        self.button3 = gtk.Button("Reboot")
        self.button3.set_border_width(10)
        self.button3.connect("clicked", self.reboot)
        self.box.pack_start(self.button3, True, True, 0)
        self.button3.show()

        # Create the "Shutdown" button.
        self.button4 = gtk.Button("Shutdown")
        self.button4.set_border_width(10)
        self.button4.connect("clicked", self.shutdown)
        self.box.pack_start(self.button4, True, True, 0)
        self.button4.show()

        # Show the dialog.
        self.box.show()
        self.window.show()

# Run the main method from the imported GTK module.
def main():
    gtk.main()

# Show the dialog if this file is being executed directly.
if __name__ == "__main__":
    dialog = SessionDialog()
    main()

