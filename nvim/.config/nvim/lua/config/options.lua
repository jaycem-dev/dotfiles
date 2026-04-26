vim.opt.number = true -- Show current line
vim.opt.relativenumber = true -- Show relative number

-- UI
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.termguicolors = true -- Forces true color support in terminals
vim.opt.cursorline = true
-- vim.opt.winblend = 10

-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true

-- Search
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.

vim.opt.breakindent = true -- Every wrapped line will continue visually indented (same amount of space as the beginning of that line)

vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.opt.splitright = true
vim.opt.splitbelow = true

-- Keep signcolumn on by default
vim.opt.signcolumn = "yes"

--vim.opt.cmdheight = 0 -- Hides command section unless used

-- vim.diagnostic.config({
-- 	virtual_lines = true,
-- })

-- see `:h completeopt`
vim.opt.completeopt = "menuone,noinsert,popup"

-- manually set filetypes not detected by vim
vim.filetype.add({
	filename = {
		[".env"] = "dotenv",
	},
	pattern = {
		[".env.*"] = "dotenv",
	},
})
