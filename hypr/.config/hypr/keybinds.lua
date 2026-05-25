local spawn_or_focus = require("utils").spawn_or_focus
local spawn_or_focus_webapp = require("utils").spawn_or_focus_webapp
local spawn_or_focus_tui = require("utils").spawn_or_focus_tui

local mod = "SUPER"
local mod2 = "SUPER + SHIFT"

local brightness = "~/.local/bin/brightness"
local volume = "~/.local/bin/volume"

-- apps,
-- format for spawn_or_focus: { cmd = "command", class = "class" }
-- format for spawn: "command"
local menu = "fuzzel"
local terminal = { cmd = "foot" }
local browser = { cmd = "brave", class = "brave-browser" }

-- webapps, use only url
local whatsapp = "web.whatsapp.com"
local protonmail = "mail.proton.me"
local yt_music = "music.youtube.com"

-- tui, class is optional
local yazi = { cmd = "yazi" }
local nvim = { cmd = "nvim -c 'lua _G.fzf_projects()'", class = "nvim" }

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "maximized" }))
hl.bind(mod2 .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + T", spawn_or_focus(terminal))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(
    mod2 .. " + Q",
    hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")
)
hl.bind(mod .. " + E", spawn_or_focus_tui(yazi))
hl.bind(mod .. " + N", spawn_or_focus_tui(nvim))
hl.bind(mod .. " + B", spawn_or_focus(browser))
hl.bind(mod .. " + W", spawn_or_focus_webapp(whatsapp))
hl.bind(mod .. " + M", spawn_or_focus_webapp(yt_music))
hl.bind(mod2 .. " + M", spawn_or_focus_webapp(protonmail))
hl.bind(mod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + G", hl.dsp.window.pin())
hl.bind(mod .. " + SPACE", hl.dsp.exec_cmd(menu))
hl.bind(mod .. " + P", hl.dsp.window.pseudo())
hl.bind(mod .. " + J", hl.dsp.layout("togglesplit")) -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mod .. " + left", hl.dsp.focus({ direction = "left" }))
hl.bind(mod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mod .. " + up", hl.dsp.focus({ direction = "up" }))
hl.bind(mod .. " + down", hl.dsp.focus({ direction = "down" }))

hl.bind(mod2 .. " + left", hl.dsp.window.move({ direction = "left" }))
hl.bind(mod2 .. " + right", hl.dsp.window.move({ direction = "right" }))
hl.bind(mod2 .. " + up", hl.dsp.window.move({ direction = "up" }))
hl.bind(mod2 .. " + down", hl.dsp.window.move({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i }))
    hl.bind(mod2 .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Example special workspace (scratchpad)
hl.bind(mod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mod2 .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd(volume .. " up"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd(volume .. " down"), { locked = true, repeating = true })
hl.bind(
    "XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),
    { locked = true, repeating = true }
)
hl.bind(
    "XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),
    { locked = true, repeating = true }
)
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(brightness .. " up"), { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(brightness .. " down"), { locked = true, repeating = true })
hl.bind(mod .. " + XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl -q -d kbd_backlight s +25%"),
    { locked = true, repeating = true })
hl.bind(mod .. " + XF86MonBrightnessDown", hl.dsp.exec_cmd("brightnessctl -q -d kbd_backlight s 25%-"),
    { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
