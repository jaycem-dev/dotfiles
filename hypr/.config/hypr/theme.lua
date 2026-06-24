local colors = {
    image = "~/Pictures/Wallpapers/default.jpg",
    base = "#191724",
    surface = "#1f1d2e",
    overlay = "#26233a",
    muted = "#6e6a86",
    subtle = "#908caa",
    text = "#e0def4",
    love = "#eb6f92",
    gold = "#f6c177",
    rose = "#ebbcba",
    pine = "#31748f",
    foam = "#9ccfd8",
    iris = "#c4a7e7",
    highlightLow = "#21202e",
    highlightMed = "#403d52",
    highlightHigh = "#524f67",
}

hl.config({
    general = {
        col = {
            active_border = { colors = { colors.iris }, angle = 45 },
            inactive_border = colors.muted,
        },
    },
})

hl.window_rule({
    match = { fullscreen = true },
    border_color = colors.love,
})

hl.on("hyprland.start", function()
    hl.exec_cmd("swaybg -i " .. colors.image .. " -m fill")
end)
