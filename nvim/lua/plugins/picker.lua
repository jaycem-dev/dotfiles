vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
    { src = "https://github.com/nvim-mini/mini.extra", version = "stable" },
})

require("mini.pick").setup({
    mappings = {
        mark = "<C-x>",
        mark_all = "<C-a>",
        choose_marked = "<C-q>",
    },
})
require("mini.extra").setup()

local pickers = require("mini.extra").pickers
local mp = require("mini.pick").builtin

-- git
vim.keymap.set("n", "<leader>gb", "<cmd>Pick git_branches<cr>", { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Pick git_commits<cr>", { desc = "Git commits" })

-- TODO: set
-- vim.keymap.set("n", "<leader>gd", function()
--     pickers.lsp({ scope = "definition" })
-- end, { desc = "Definition" })

-- files & buffers
vim.keymap.set("n", "<leader>fb", "<cmd>Pick buffers<cr>", { desc = "Find buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Find files" })
-- search
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Grep project" })
-- misc
vim.keymap.set("n", "<leader>fk", "<cmd>Pick keymaps<cr>", { desc = "Find keymaps" })
vim.keymap.set("n", "<leader>fh", "<cmd>Pick help<cr>", { desc = "Find help" })
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick resume<cr>", { desc = "Resume" })
vim.keymap.set("n", "<leader>fo", "<cmd>Pick oldfiles<cr>", { desc = "Old files" })

-- LSP
vim.keymap.set("n", "<leader>fr", function()
    pickers.lsp({ scope = "references" })
end, { desc = "Find references (LSP)" })
vim.keymap.set("n", "<leader>fi", function()
    pickers.lsp({ scope = "implementation" })
end, { desc = "Find implementations (LSP)" })
vim.keymap.set("n", "<leader>ft", function()
    pickers.lsp({ scope = "type_definition" })
end, { desc = "Type definition" })
vim.keymap.set("n", "<leader>fD", function()
    pickers.diagnostic({ scope = "all" })
end, { desc = "Find diagnostics on workspace (LSP)" })
vim.keymap.set("n", "<leader>fd", function()
    pickers.diagnostic({ scope = "current" })
end, { desc = "Find diagnostics on current buffer (LSP)" })
vim.keymap.set("n", "<leader>fs", function()
    pickers.lsp({ scope = "document_symbol" })
end, { desc = "Find document symbols (LSP)" })
vim.keymap.set("n", "<leader>fS", function()
    pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "Find workspace symbols (LSP)" })
-- Neovim
vim.keymap.set("n", "<leader>fm", "<cmd>Pick marks<cr>", { desc = "Find marks" })
vim.keymap.set("n", "<leader>vs", "<cmd>Pick spellsuggest<cr>", { desc = "Spell suggestions" })

-- custom
vim.keymap.set("n", "<leader>fc", function()
    mp.files({}, { source = { cwd = vim.fn.expand("~/.config/nvim") } })
end, { desc = "Find nvim config" })

vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, { desc = "Code actions" })
