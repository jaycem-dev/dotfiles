-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })

vim.g.mapleader = " "
vim.g.session_dir = vim.fn.stdpath("data") .. "/sessions"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.scrolloff = 10
vim.opt.confirm = true -- ask for save on :q
vim.opt.breakindent = true -- continue indentation
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- UI
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.laststatus = 3
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.cursorline = true
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0
-- Search
vim.opt.ignorecase = true -- Ignore case in search patterns.
vim.opt.smartcase = true -- Override the 'ignorecase' option if the search pattern contains upper case characters.
-- backup
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
