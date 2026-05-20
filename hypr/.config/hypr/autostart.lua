local image = require("colors").image

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/
hl.on("hyprland.start", function()
	hl.exec_cmd("waybar -c ~/.config/waybar/hypr.jsonc")
	hl.exec_cmd("swayidle -c ~/.config/waybar/hypr.jsonc")
	hl.exec_cmd("swaybg -i " .. image .. " -m fill")
	hl.exec_cmd("hyprsunset")
end)

-- ENVIRONMENT VARIABLES
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XCURSOR_THEME", "Bibata-Modern-Ice")
