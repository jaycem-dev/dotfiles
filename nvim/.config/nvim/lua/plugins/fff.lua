vim.pack.add({
	{ src = "https://github.com/dmtrKovalenko/fff.nvim", version = vim.version.range("*") },
})

vim.g.fff = {
	lazy_sync = true,
	debug = { enabled = true, show_scores = true },
}

vim.keymap.set("n", "<leader>ff", function()
	require("fff").find_files()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fg", function()
	require("fff").live_grep()
end, { desc = "Find files" })

vim.keymap.set("n", "<leader>fw", function()
	require("fff").live_grep({ query = vim.fn.expand("<cword>") })
end, { desc = "Find current word" })
