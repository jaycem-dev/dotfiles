vim.pack.add({
    "https://github.com/RRethy/base16-nvim",
})

require("base16-colorscheme").setup({
    -- Background tones
    base00 = "#0f1416", -- Default Background
    base01 = "#1b2023", -- Lighter Background (status bars)
    base02 = "#252b2d", -- Selection Background
    base03 = "#8a9296", -- Comments, Invisibles
    -- Foreground tones
    base04 = "#bfc8cc", -- Dark Foreground (status bars)
    base05 = "#dee3e6", -- Default Foreground
    base06 = "#dee3e6", -- Light Foreground
    base07 = "#dee3e6", -- Lightest Foreground
    -- Accent colors
    base08 = "#ffb4ab", -- Variables, XML Tags, Errors
    base09 = "#c3c3eb", -- Integers, Constants
    base0A = "#b3cad4", -- Classes, Search Background
    base0B = "#88d1ec", -- Strings, Diff Inserted
    base0C = "#c3c3eb", -- Regex, Escape Chars
    base0D = "#88d1ec", -- Functions, Methods
    base0E = "#b3cad4", -- Keywords, Storage
    base0F = "#93000a", -- Deprecated, Embedded Tags
})

-- Register a signal handler for SIGUSR1 (matugen updates)
local signal = vim.uv.new_signal()
signal:start(
    "sigusr1",
    vim.schedule_wrap(function()
        package.loaded["base16-colorscheme"] = nil
        package.loaded["plugins.theme"] = nil
        require("plugins.theme")
    end)
)
