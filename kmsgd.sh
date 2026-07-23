#!/bin/sh
# Author: NAZY-OS
# License: MIT
# Name: kmsgd.sh
# Version: 1.0.9
#
# Kernel message daemon (main service)
# KISS style, compatible with Linux and BSD

set -eu

## CONFIG
PIDFILE="/var/run/kmsgd.pid"
TTY="${1:-12}"  # Default to tty12 if no parameter given

## MAIN
echo "Kernel message daemon started (PID $$)"
echo "Monitoring kernel messages on /dev/tty${TTY}"

# Main loop with shebang
while true; do
    #!/bin/sh
    dmesg --human -T -l 6 -w --color --follow-new < "/dev/tty${TTY}" > "/dev/tty${TTY}" 2>&1
    sleep 1
done

