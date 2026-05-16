-- global keymaps
-- for plugin keymaps look into each plugin spec in /lua/plugins/*
vim.g.mapleader = " "

-- easier exit terminal mode bind
vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], { desc = "Exit terminal mode" })

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- buffer navigation, similar to tmux
vim.keymap.set("n", "<leader>l", ":buffer #<CR>", { desc = "Last buffer" })

-- map <c-space> to activate completion
vim.keymap.set("i", "<c-space>", function()
    vim.lsp.completion.get()
end)

-- Map <leader>y to yank to system clipboard
vim.keymap.set({ "v" }, "<leader>y", '"+y', { desc = "Yank to system clipboard" })

-- Toggle Quickfix List
vim.keymap.set("n", "<leader>q", function()
    local is_open = vim.iter(vim.fn.getwininfo()):any(function(win)
        return win.quickfix == 1
    end)
    vim.cmd(is_open and "cclose" or "copen")
end, { desc = "Toggle Quickfix List" })
