#!/usr/bin/env bash

if (($# == 0)); then
    >&2 echo 'Error: expected arguments'
    exit 1
fi

shutdown_timeout_duration=15

keep_names=(
    "niri"
    "systemd"
    "dbus-daemon"
    "dbus-broker"
    "dbus-broker-launcher"
    "pipewire"
    "wireplumber"
)

keep_patterns=(
    "xdg-desktop-portal"     # Catch portal-gtk, portal-gnome, etc.
    "dbus-run-session.*niri" # The session wrapper
)

name_regex=$(
    IFS='|'
    echo "${keep_names[*]}"
)
pattern_regex=$(
    IFS='|'
    echo "${keep_patterns[*]}"
)

pids_to_save=$(
    pgrep -u "$USER" -x "$name_regex"
    pgrep -u "$USER" -f "$pattern_regex"
    echo "$$"
)

guillotine=$(pgrep -u "$USER" | grep -Fvx -f <(echo "$pids_to_save"))

if [[ -n "$guillotine" ]]; then
    timeout "$shutdown_timeout_duration" \
        parallel -j 0 'kill -TERM {} 2>/dev/null && tail --pid={} -f /dev/null' <<<"$guillotine"
fi

"$@"
