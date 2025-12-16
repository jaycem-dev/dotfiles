# autostart hyprland on tty1 
if status is-login
    if test -z "$DISPLAY" -a (tty) = /dev/tty1
        Hyprland
    end
end
