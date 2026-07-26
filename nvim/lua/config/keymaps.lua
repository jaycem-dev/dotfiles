-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "
local map = vim.keymap.set

map("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })
map("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })
map("n", "<leader>l", ":buffer #<CR>", { silent = true, desc = "Last buffer" })
map("n", "<C-c>", ":bwipeout<CR>", { silent = true, desc = "Close current buffer" })

-- clipboard and registers
map("v", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("n", "<leader>y", '"+y', { desc = "Yank to system clipboard" })
map("v", "<leader>p", '"_dP', { desc = "Paste without overwriting register" })

-- tab management
map("n", "<leader>tt", ":tabnew<CR>", { silent = true, desc = "New tab" })
map("n", "<leader>tq", ":tabclose<CR>", { silent = true, desc = "Close tab" })
map("n", "<leader>tn", ":tabnext<CR>", { silent = true, desc = "Next tab" })
map("n", "<leader>tp", ":tabprevious<CR>", { silent = true, desc = "Previous tab" })

-- move lines
map("v", "<C-down>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Moves visual selection down" })
map("v", "<C-j>", ":m '>+1<CR>gv=gv", { silent = true, desc = "Moves visual selection down" })
map("v", "<C-up>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Moves visual selection up" })
map("v", "<C-k>", ":m '<-2<CR>gv=gv", { silent = true, desc = "Moves visual selection up" })

-- center after actions and QoL
map("n", "J", "mzJ`z", { silent = true, desc = "Join lines without moving cursor" })
map("v", "<", "<gv", { silent = true, desc = "Unindent and keep selection" })
map("v", ">", ">gv", { silent = true, desc = "Indent and keep selection" })
map("n", "<C-d>", "<C-d>zz", { silent = true, desc = "Move down in buffer with cursor centered" })
map("n", "<C-u>", "<C-u>zz", { silent = true, desc = "Move up in buffer with cursor centered" })
map("n", "n", "nzzzv", { silent = true, desc = "Next search result cursor centered" })
map("n", "N", "Nzzzv", { silent = true, desc = "Previous search result cursor centered" })

-- remap macro to Q
map("n", "q", "<Nop>", { noremap = true })
map("n", "Q", "q", { noremap = true, desc = "Record macro" })

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

-- Copy file path / selection reference for pasting into AI chats
local function copy_ref(opts)
    local path = vim.fn.expand("%:.")
    local ref = path
    if opts.visual then
        local s = math.min(vim.fn.line("v"), vim.fn.line("."))
        local e = math.max(vim.fn.line("v"), vim.fn.line("."))
        ref = "@" .. path .. "#" .. s .. "-" .. e
    end
    vim.fn.setreg("+", ref)
    vim.notify("Copied: " .. ref)
end

-- normal mode: copy just the file path
map("n", "<leader>c", function()
    copy_ref({})
end, { desc = "Copy file path" })

map("v", "<leader>c", function()
    copy_ref({ visual = true })
end, { desc = "Copy file path with line range" })
