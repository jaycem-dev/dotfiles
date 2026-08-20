-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "

local map = vim.keymap.set

-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open, { desc = "Toggle undotree" })

map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>nohlsearch<cr>", { desc = "Clear search highlights" })
map("n", "<leader>l", ":buffer #<cr>", { silent = true, desc = "Last buffer" })
map("n", "<C-c>", ":bwipeout<cr>", { silent = true, desc = "Close current buffer" })
map("n", "<leader>vc", "<cmd>mksession<cr>", { desc = "Create session" })

-- clipboard and registers
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- tab management
map("n", "<leader>tt", ":tabnew<cr>", { silent = true, desc = "New tab" })
map("n", "<leader>tq", ":tabclose<cr>", { silent = true, desc = "Close tab" })
map("n", "<leader>tn", ":tabnext<cr>", { silent = true, desc = "Next tab" })
map("n", "<leader>tp", ":tabprevious<cr>", { silent = true, desc = "Previous tab" })

-- window navigation
map("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })
map("n", "<C-left>", "<C-w>h", { desc = "Move to left window" })
map("n", "<C-down>", "<C-w>j", { desc = "Move to lower window" })
map("n", "<C-up>", "<C-w>k", { desc = "Move to upper window" })
map("n", "<C-right>", "<C-w>l", { desc = "Move to right window" })
-- move lines
map("v", "<C-down>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Moves visual selection down" })
map("v", "<C-j>", ":m '>+1<cr>gv=gv", { silent = true, desc = "Moves visual selection down" })
map("v", "<C-up>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Moves visual selection up" })
map("v", "<C-k>", ":m '<-2<cr>gv=gv", { silent = true, desc = "Moves visual selection up" })

-- center after actions and QoL
map("n", "J", "mzJ`z", { silent = true, desc = "Join lines without moving cursor" })
map("v", "<", "<gv", { silent = true, desc = "Unindent and keep selection" })
map("v", ">", ">gv", { silent = true, desc = "Indent and keep selection" })
map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Move up in buffer with cursor centered" })
map("n", "n", "nzzzv", { silent = true, desc = "Next search result cursor centered" })
map("n", "N", "Nzzzv", { silent = true, desc = "Previous search result cursor centered" })

map("n", "<leader>q", function()
    local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
        return win.quickfix == 1
    end)
    vim.cmd(is_open and "cclose" or "copen")
end, { desc = "Toggle Quickfix List" })

-- search and replace
map("n", "<leader>s", function()
    local word = vim.fn.expand("<cword>")
    vim.api.nvim_feedkeys(vim.keycode(":%s/" .. word .. "//gc<Left><Left>"), "n", false)
end, { desc = "Replace word under cursor" })

map("v", "<leader>s", function()
    local sel = table.concat(vim.fn.getregion(vim.fn.getpos("v"), vim.fn.getpos("."), { type = "v" }))
    sel = vim.fn.escape(sel, "\\^$.*[]~/")
    vim.api.nvim_feedkeys(vim.keycode(":%s/" .. sel .. "//gc<Left><Left>"), "n", false)
end, { desc = "Replace visual selection" })

-- copy just the file path
map("n", "<leader>c", function()
    local path = vim.fn.expand("%:.")
    vim.fn.setreg("+", path)
    vim.notify("Copied: " .. path)
end, { desc = "Copy file path" })

-- vim.pack management
map("n", "<leader>vR", function()
    local unused = {}
    for _, p in ipairs(vim.pack.get()) do
        if not p.active then
            table.insert(unused, p.spec.name)
        end
    end
    if #unused > 0 then
        vim.pack.del(unused)
    else
        vim.notify("No unused plugins to remove", vim.log.levels.INFO)
    end
end, { desc = "Remove unused vim.pack plugins" })

map("n", "<leader>vu", function()
    vim.pack.update()
end, { desc = "Update plugins" })
