# autostart hyprland on tty1 
if status is-login
    if test -z "$DISPLAY" -a (tty) = /dev/tty1
        if uwsm check may-start
            exec uwsm start hyprland.desktop
        end
    end
end
