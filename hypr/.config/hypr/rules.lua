local colors = require("colors")
local webapp_class = require("utils").webapp_class

-- pip
hl.window_rule({
    name = "apply-something",
    match = {
        title = "Picture in picture"
    },
    float = true,
    pin = true,
    keep_aspect_ratio = true,
    no_initial_focus = true,
    size = { 384, 216 },
    move = { "monitor_w - window_w - 5", 5 }
})

-- workspace assignment
hl.window_rule({
    match = {
        class = "brave-browser",
    },
    workspace = 1,
})
hl.window_rule({
    match = {
        class = "foot|kitty|nvim",
    },
    workspace = 2,
})
hl.window_rule({
    match = {
        class = webapp_class("music.youtube.com"),
    },
    workspace = 3,
})
hl.window_rule({
    match = {
        class = webapp_class("web.whatsapp.com") .. "|" .. webapp_class("mail.proton.me"),
    },
    workspace = 4,
})
hl.window_rule({
    match = {
        class = "steam|electron",
    },
    workspace = 5,
})

hl.layer_rule({
    match = { namespace = "waybar" },
    blur = true,
    ignore_alpha = 0.5,
    xray = true,
})
hl.layer_rule({
    match = { namespace = "launcher" },
    blur = true,
    ignore_alpha = 0.5,
    xray = true,
})

-- Example window rules that are useful
hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name = "suppress-maximize-events",
    match = { class = ".*" },
    suppress_event = "maximize",
})

-- Set border color to red if window is fullscreen
hl.window_rule({
    match = { fullscreen = true },
    border_color = colors.error,
})

-- Inhibit idle when any window is fullscreen
hl.window_rule({
    match = { class = ".*" },
    idle_inhibit = "fullscreen",
})

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name = "fix-xwayland-drags",
    match = {
        class = "^$",
        title = "^$",
        xwayland = true,
        float = true,
        fullscreen = false,
        pin = false,
    },
    no_focus = true,
})

-- Hyprland-run windowrule
hl.window_rule({
    name = "move-hyprland-run",
    match = { class = "hyprland-run" },
    move = "20 monitor_h-120",
    float = true,
})
