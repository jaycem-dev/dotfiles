vim.pack.add({
	{
		src = "https://github.com/stevearc/oil.nvim",
		version = vim.version.range("*"),
	},
})

require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })
