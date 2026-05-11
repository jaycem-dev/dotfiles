vim.pack.add({
	{ src = "https://github.com/dmtrKovalenko/fff.nvim", version = vim.version.range("*") },
})

vim.g.fff = {
	lazy_sync = true,
	-- debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "<leader>f", function()
	require("fff").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>/", function()
	require("fff").live_grep()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>w", function()
	require("fff").live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "Find current word" })
