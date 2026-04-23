vim.pack.add({
	"https://github.com/RRethy/base16-nvim",
})

require("base16-colorscheme").setup({
	-- Background tones
	base00 = "#151218", -- Default Background
	base01 = "#221e24", -- Lighter Background (status bars)
	base02 = "#2c292e", -- Selection Background
	base03 = "#958e98", -- Comments, Invisibles
	-- Foreground tones
	base04 = "#ccc4cf", -- Dark Foreground (status bars)
	base05 = "#e8e0e8", -- Default Foreground
	base06 = "#e8e0e8", -- Light Foreground
	base07 = "#e8e0e8", -- Lightest Foreground
	-- Accent colors
	base08 = "#ffb4ab", -- Variables, XML Tags, Errors
	base09 = "#f3b7bf", -- Integers, Constants
	base0A = "#d0c1da", -- Classes, Search Background
	base0B = "#d9bafa", -- Strings, Diff Inserted
	base0C = "#f3b7bf", -- Regex, Escape Chars
	base0D = "#d9bafa", -- Functions, Methods
	base0E = "#d0c1da", -- Keywords, Storage
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
