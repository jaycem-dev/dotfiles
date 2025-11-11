#!/usr/bin/env bash

CHOSEN=$(printf "Lock\nSuspend\nReboot\nShutdown\nLog Out" | rofi -dmenu -p "Power Menu")

case "$CHOSEN" in
"Lock") uwsm app -- hyprlock ;;
"Suspend") systemctl suspend ;;
"Reboot") systemctl reboot ;;
"Shutdown") systemctl poweroff ;;
"Log Out") uwsm stop ;;
*) exit 1 ;;
esac
