local colors = require("colors")

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- workspace assignment
hl.window_rule({
	match = {
		class = "foot|kitty",
	},
	workspace = 2,
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
