vim.pack.add({
	"https://github.com/catgoose/nvim-colorizer.lua",
	"https://github.com/nvim-tree/nvim-web-devicons",
	{
		src = "https://github.com/stevearc/oil.nvim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/ibhagwan/fzf-lua",
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
	{
		src = "https://github.com/folke/flash.nvim",
		version = vim.version.range("*"),
	},
})

-- builtin plugins
vim.cmd("packadd nvim.undotree")
-- no config needed
require("colorizer").setup()
require("gitsigns").setup()
require("nvim-web-devicons").setup()
require("which-key").setup({
	preset = "helix",
})

-- flash
vim.keymap.set({ "n", "x", "o" }, "s", function()
	require("flash").jump()
end, { desc = "Flash" })
vim.keymap.set({ "n", "x", "o" }, "S", function()
	require("flash").treesitter()
end, { desc = "Flash Treesitter" })
vim.keymap.set("o", "r", function()
	require("flash").remote()
end, { desc = "Remote Flash" })
vim.keymap.set("o", "R", function()
	require("flash").treesitter_search()
end, { desc = "Treesitter Search" })
vim.keymap.set("c", "<c-s>", function()
	require("flash").toggle()
end, { desc = "Toggle Flash Search" })

-- oil (file explorer)
require("oil").setup({
	view_options = {
		show_hidden = true,
	},
})
vim.keymap.set("n", "<leader>e", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- fzf (fuzzy finder)
local actions = require("fzf-lua.actions")
require("fzf-lua").setup({
	fzf_colors = {
		true, -- inherit from nvim theme
	},
	grep = {
		-- search dotfiles as well
		hidden = true,
	},
	actions = {
		files = {
			true, -- inherit from defaults
			["ctrl-q"] = actions.file_sel_to_qf,
		},
	},
	winopts = {
		border = "single",
		preview = {
			border = "single",
		},
	},
})
-- Keymaps
vim.keymap.set("n", "<leader>f", require("fzf-lua").files, { desc = "Find files" })
vim.keymap.set("n", "<leader>/", require("fzf-lua").live_grep_native, { desc = "Grep project" })
vim.keymap.set("v", "<leader>/", require("fzf-lua").grep_visual, { desc = "Grep visual selection" })
vim.keymap.set("n", "<leader>b", require("fzf-lua").buffers, { desc = "Find buffers" })
vim.keymap.set("n", "<leader>k", require("fzf-lua").keymaps, { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>h", require("fzf-lua").helptags, { desc = "Find help" })
-- LSP keymaps
vim.keymap.set("n", "<leader>r", require("fzf-lua").lsp_references, { desc = "Find references (LSP)" })
vim.keymap.set("n", "<leader>i", require("fzf-lua").lsp_implementations, { desc = "Find implementations (LSP)" })
vim.keymap.set(
	"n",
	"<leader>D",
	require("fzf-lua").diagnostics_workspace,
	{ desc = "Find diagnostics on workspace (LSP)" }
)
vim.keymap.set(
	"n",
	"<leader>d",
	require("fzf-lua").diagnostics_document,
	{ desc = "Find diagnostics on current buffer (LSP)" }
)
vim.keymap.set("n", "<leader>s", require("fzf-lua").lsp_document_symbols, { desc = "Find document symbols (LSP)" })
vim.keymap.set("n", "<leader>S", require("fzf-lua").lsp_workspace_symbols, { desc = "Find workspace symbols (LSP)" })
vim.keymap.set("n", "<leader>a", require("fzf-lua").lsp_code_actions, { desc = "Code actions" })
-- Neovim
vim.keymap.set("n", "<leader>m", require("fzf-lua").marks, { desc = "Find marks" })
