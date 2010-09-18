#!/bin/sh
# powersave.sh | Curtis Free (http://curtisfree.com)
# Checks current state of battery and acts to save battery life (if discharging).
# Also see batt.sh.
#
# See:
#   http://www.shallowsky.com/linux/x-screen-blanking.html
#   http://www.filibeto.org/sun/lib/development/shell/intr_to_bash_scr.html
# I might have used other site(s) as reference, but I cannot remember them.

BATTERY=/proc/acpi/battery/BAT0 # battery
NUM_PROCESSORS=2                # number of processors

# Helper for setting CPU frequency on all processors.
function set_cpufreq() {
    for processor_num in $(seq 0 $((${NUM_PROCESSORS} - 1))); do
        sudo cpufreq-set -c ${processor_num} -g $1
    done
}

# Charging
if ! grep 'discharging' ${BATTERY}/state &>/dev/null; then
    echo "Battery not discharging. Setting default DPMS timeouts and 'performance' CPU governor."
    xset dpms 600 900 1200 # 10 mins, 15 mins, 20 mins
    set_cpufreq performance

# Discharging
else
    echo "Battery discharging. Setting power-saving DPMS timeouts and 'ondemand' CPU governor."
    xset dpms 30 60 90 # 30 secs, 1 min, 90 secs
    set_cpufreq ondemand
fi

