-- small plugins with small or no config
vim.pack.add({
    "https://github.com/catgoose/nvim-colorizer.lua",
    "https://github.com/nvim-tree/nvim-web-devicons",
    { src = "https://github.com/supermaven-inc/supermaven-nvim", version = "main" },
    { src = "https://github.com/kylechui/nvim-surround", version = vim.version.range("*") },
    { src = "https://github.com/windwp/nvim-autopairs", version = vim.version.range("*") },
    { src = "https://github.com/folke/which-key.nvim", version = vim.version.range("*") },
    { src = "https://github.com/lewis6991/gitsigns.nvim", version = vim.version.range("*") },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", version = vim.version.range("*") },
})

-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)
-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true })

-- simgle config / no config
require("supermaven-nvim").setup({})
require("nvim-autopairs").setup({})
require("colorizer").setup()
require("nvim-web-devicons").setup()
require("which-key").setup({
    preset = "helix",
    delay = 500,
})
