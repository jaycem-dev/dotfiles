vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.iskeyword:append({ "_", "-" }) -- treat _ and - as part of words
vim.opt.scrolloff = 10
vim.opt.confirm = true                 -- ask for save on :q
vim.opt.breakindent = true             -- continue indentation
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
-- UI
vim.opt.winborder = "single"
vim.opt.pumborder = "single"
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.laststatus = 3            -- global statusline
vim.opt.fillchars = { eob = " " } -- remove ~ at end of buffer
vim.opt.signcolumn = "yes"
vim.opt.cmdheight = 0             -- hides cmd until used
vim.opt.pumheight = 10            -- popup menu items
-- Search
vim.opt.ignorecase = true         -- Ignore case in search patterns.
vim.opt.smartcase = true          -- Override the 'ignorecase' option if the search pattern contains upper case characters.
-- completion
vim.opt.completeopt = "menuone,noinsert,popup"
-- diagnostics
vim.diagnostic.config({
    status = {
        format = {
            [vim.diagnostic.severity.ERROR] = " ",
            [vim.diagnostic.severity.WARN] = " ",
            [vim.diagnostic.severity.INFO] = " ",
            [vim.diagnostic.severity.HINT] = "󰌵 ",
        },
    },
})
