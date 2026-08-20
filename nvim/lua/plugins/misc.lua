-- small plugins with small or no config
vim.pack.add({
    { src = "https://github.com/catgoose/nvim-colorizer.lua" },
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/sindrets/diffview.nvim" },
    { src = "https://github.com/github/copilot.vim", version = vim.version.range("*") },
    { src = "https://github.com/folke/which-key.nvim", version = vim.version.range("*") },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.pairs", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.surround", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.sessions", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.icons", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.diff", version = vim.version.range("*") },
    { src = "https://github.com/stevearc/oil.nvim", version = vim.version.range("*") },
})

require("colorizer").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require("mini.sessions").setup({ autoread = true })
require("mini.icons").setup()
require("mini.icons").mock_nvim_web_devicons()

require("which-key").setup({ preset = "helix", delay = 500 })

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })

require("oil").setup()
vim.keymap.set("n", "<leader>e", "<cmd>Oil<cr>", { desc = "Open parent directory" })
