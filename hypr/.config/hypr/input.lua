hl.config({
    input = {
        kb_layout = "us,us",
        kb_variant = "colemak_dh_iso,",
        kb_model = "",
        kb_options = "caps:escape,grp:alt_shift_toggle",
        kb_rules = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.

        touchpad = {
            tap_to_click = false,
            natural_scroll = true,
            clickfinger_behavior = true,
        },
    },
    cursor = {
        inactive_timeout = 0.5,
        hide_on_key_press = true,
    },
})

hl.gesture({
    fingers = 3,
    direction = "vertical",
    action = "workspace",
})
hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "scroll_move",
})
