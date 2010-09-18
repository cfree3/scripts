#!/bin/bash
# batt.sh | Curtis Free (http://curtisfree.com)
# Extracts some simple information regarding the current state of the battery.

BATTERY=/proc/acpi/battery/BAT0

awk -f - ${BATTERY}/state <<__EOP__

    # pattern                         action
    /^charging state:          (.*)$/ { state=\$3 };

    /^remaining capacity:      (.*)$/ { charge=\$3 ; units=\$4 };

    END                               { print state " (" charge " " units ")" };

__EOP__

