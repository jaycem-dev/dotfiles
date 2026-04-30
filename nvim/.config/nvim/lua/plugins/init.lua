vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/supermaven-inc/supermaven-nvim",
		version = "main",
	},
	{
		src = "https://github.com/kylechui/nvim-surround",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/windwp/nvim-autopairs",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/folke/which-key.nvim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/lewis6991/gitsigns.nvim",
		version = vim.version.range("*"),
	},
})

-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)

-- no config needed
require("supermaven-nvim").setup({})
require("nvim-autopairs").setup({})
require("colorizer").setup()
require("gitsigns").setup()
require("nvim-web-devicons").setup()
require("which-key").setup({
	preset = "helix",
})

-- external config
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.linter")
require("plugins.formatter")
require("plugins.theme")
require("plugins.fzf")
require("plugins.flash")
require("plugins.oil")
