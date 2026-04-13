vim.pack.add({
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
})

require("supermaven-nvim").setup({})
require("nvim-autopairs").setup({})
