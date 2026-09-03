vim.pack.add({
    { src = "https://github.com/nvim-mini/mini.pick", version = "stable" },
    { src = "https://github.com/nvim-mini/mini.extra", version = "stable" },
})

require("mini.extra").setup()
require("mini.pick").setup({
    mappings = { choose_marked = "<C-q>" },
    window = {
        config = function()
            return { width = vim.o.columns }
        end,
    },
})

local pickers = require("mini.extra").pickers
local MiniPick = require("mini.pick")

-- git
vim.keymap.set("n", "<leader>gb", "<cmd>Pick git_branches<cr>", { desc = "Git branches" })
vim.keymap.set("n", "<leader>gc", "<cmd>Pick git_commits<cr>", { desc = "Git commits" })

-- files & buffers
vim.keymap.set("n", "<leader>fb", function()
    require("mini.pick").builtin.buffers({ include_current = false }, {
        mappings = {
            wipeout = {
                char = "<C-d>",
                func = function()
                    local matches = MiniPick.get_picker_matches()
                    local buffers = vim.tbl_map(function(m)
                        return m.bufnr
                    end, matches.marked)
                    if #buffers == 0 then
                        table.insert(buffers, matches.current.bufnr)
                    end
                    for _, bufnr in ipairs(buffers) do
                        if vim.api.nvim_buf_is_valid(bufnr) then
                            vim.api.nvim_buf_delete(bufnr, { force = true })
                        end
                    end
                    -- Re-fetch buffer list with full item structure (preserves names)
                    local new_items = vim.fn.getbufinfo({ buflisted = 1 })
                    local items = vim.tbl_map(function(b)
                        return { bufnr = b.bufnr, text = vim.fn.bufname(b.bufnr) }
                    end, new_items)
                    MiniPick.set_picker_items(items, { do_match = true })
                end,
            },
        },
    })
end, { desc = "Buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd>Pick files<cr>", { desc = "Files" })

-- search
vim.keymap.set("n", "<leader>fg", "<cmd>Pick grep<cr>", { desc = "Grep" })
vim.keymap.set("n", "<leader>/", "<cmd>Pick grep_live<cr>", { desc = "Live grep" })

-- misc
vim.keymap.set("n", "<leader><leader>", "<cmd>Pick resume<cr>", { desc = "Resume" })
vim.keymap.set("n", "<leader>fo", "<cmd>Pick oldfiles<cr>", { desc = "Old files" })

-- LSP
-- TODO: set
-- vim.keymap.set("n", "<leader>gd", function()
--     pickers.lsp({ scope = "definition" })
-- end, { desc = "Definition" })
vim.keymap.set("n", "<leader>fa", vim.lsp.buf.code_action, { desc = "Code actions" })
vim.keymap.set("n", "<leader>fr", function()
    pickers.lsp({ scope = "references" })
end, { desc = "LSP references" })
vim.keymap.set("n", "<leader>fi", function()
    pickers.lsp({ scope = "implementation" })
end, { desc = "LSP implementations" })
vim.keymap.set("n", "<leader>ft", function()
    pickers.lsp({ scope = "type_definition" })
end, { desc = "LSP Type definition" })
vim.keymap.set("n", "<leader>fD", function()
    pickers.diagnostic({ scope = "all" })
end, { desc = "LSP workspace diagnostics" })
vim.keymap.set("n", "<leader>fd", function()
    pickers.diagnostic({ scope = "current" })
end, { desc = "LSP diagnostics" })
vim.keymap.set("n", "<leader>fs", function()
    pickers.lsp({ scope = "document_symbol" })
end, { desc = "LSP symbols" })
vim.keymap.set("n", "<leader>fS", function()
    pickers.lsp({ scope = "workspace_symbol" })
end, { desc = "LSP workspace symbols" })

-- neovim
vim.keymap.set("n", "<leader>fm", "<cmd>Pick marks<cr>", { desc = "Marks" })
vim.keymap.set("n", "<leader>vs", "<cmd>Pick spellsuggest<cr>", { desc = "Spell suggestions" })
vim.keymap.set("n", "<leader>vk", "<cmd>Pick keymaps<cr>", { desc = "Keymaps" })
vim.keymap.set("n", "<leader>vh", "<cmd>Pick help<cr>", { desc = "Help" })

-- custom
vim.keymap.set("n", "<leader>fc", function()
    require("mini.pick").builtin.files({}, { source = { cwd = vim.fn.expand("~/.config/nvim") } })
end, { desc = "Neovim config" })
