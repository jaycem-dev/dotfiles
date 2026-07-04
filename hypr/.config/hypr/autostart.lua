-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
local image = require("colors").image

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar -c ~/.config/waybar/hypr.jsonc")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("hyprsunset")
    hl.exec_cmd("swaybg -i " .. image .. " -m fill")

    -- nixos asahi display issue workaround
    hl.exec_cmd(
        [[hyprctl dispatch 'hl.dsp.dpms({ action = "disable" })'; sleep 1; hyprctl dispatch 'hl.dsp.dpms({ action = "enable" })']]
    )
end)

-- ENVIRONMENT VARIABLES
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")

hl.env("QT_WAYLAND_DISABLE_WINDOWDECORATION", "1")
hl.env("QT_QPA_PLATFORMTHEME", "qt5ct")
