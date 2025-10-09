#!/bin/bash

# Usage:
# ./close_apps_and_power.sh [shutdown|reboot]
# Default: shutdown

ACTION=${1:-shutdown}

# Validate action
if [[ "$ACTION" != "shutdown" && "$ACTION" != "reboot" ]]; then
    echo "Invalid argument: '$ACTION'"
    echo "Usage: $0 [shutdown|reboot]"
    exit 1
fi

# Dependencies: hyprctl, jq, notify-send

# Step 1: Gracefully close all windows via signalwindow
clients=$(hyprctl clients -j | jq -r '.[].address')

for addr in $clients; do
    hyprctl dispatch signalwindow address:"$addr",9
done

# Step 2: Wait up to 5 seconds for all windows to close
max_wait=5
elapsed=0

while true; do
    count=$(hyprctl clients -j | jq 'length')

    if [ "$count" -eq 0 ]; then
        break
    fi

    if [ "$elapsed" -ge "$max_wait" ]; then
        notify-send -u critical "Power Action Aborted" \
            "Could not close all apps. Please close remaining apps manually and try again."
        echo "Timeout reached. $count window(s) still open."
        exit 1
    fi

    sleep 1
    ((elapsed++))
done

# Step 3: Power action
if [ "$ACTION" == "reboot" ]; then
    systemctl reboot
else
    systemctl poweroff
fi
