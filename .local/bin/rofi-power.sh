#!/usr/bin/env bash

# Define the menu options with Font Awesome icons
OPTIONS="Lock
Suspend
Reboot
Shutdown
Logout"

# Use rofi, wofi, or dmenu to choose
CHOSEN=$(echo -e "$OPTIONS" | rofi -dmenu -i -p "Power Menu")

# Execute actions
case "$CHOSEN" in
"Lock") hyprlock ;;
"Suspend") systemctl suspend ;;
"Reboot") systemctl reboot ;;
"Shutdown") systemctl poweroff ;;
"Logout") uwsm stop ;;
*) exit 1 ;;
esac
