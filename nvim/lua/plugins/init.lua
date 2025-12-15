-- native nvim package manager

vim.pack.add({
	{
		src = "https://github.com/ibhagwan/fzf-lua",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/rose-pine/neovim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main"
	},
	{
		src = "https://github.com/stevearc/conform.nvim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/echasnovski/mini.nvim",
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

-- external config
require("plugins.fzf")
require("plugins.lsp")
require("plugins.theme")
require("plugins.treesitter")
-- TODO: lazy load the plugin after saving a file
require("plugins.formatter")

-- no config needed
require("mini.pairs").setup()
require("mini.icons").setup()
require("mini.surround").setup()
require("gitsigns").setup()
