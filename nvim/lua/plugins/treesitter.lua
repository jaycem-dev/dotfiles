local ts_parsers = {
	"javascript",
	"typescript",
	"tsx",
	"astro",
	"lua",
	"html",
	"css",
	"bash",
	"python",
	"rust",
	"go"
}

local ts = require("nvim-treesitter")

ts.install(ts_parsers)
