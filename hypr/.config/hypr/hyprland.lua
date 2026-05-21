require("monitor")
require("keybinds")
require("input")
require("appearance")
require("rules")
require("autostart")

hl.config({
    misc = {
        force_default_wallpaper = 0, -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
    ecosystem = {
        no_update_news = true,
        no_donation_nag = true,
    },
})
