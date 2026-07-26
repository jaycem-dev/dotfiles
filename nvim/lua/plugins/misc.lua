-- small plugins with small or no config
vim.pack.add({
    "https://github.com/catgoose/nvim-colorizer.lua",
    { src = "https://github.com/supermaven-inc/supermaven-nvim", version = vim.version.range("*") },
    { src = "https://github.com/folke/which-key.nvim", version = vim.version.range("*") },
    { src = "https://github.com/MeanderingProgrammer/render-markdown.nvim", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.pairs", version = "stable" },
    { src = "https://github.com/nvim-mini/mini.surround", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.icons", version = vim.version.range("*") },
    { src = "https://github.com/nvim-mini/mini.diff", version = vim.version.range("*") },
})

-- builtin plugins
vim.cmd("packadd nvim.undotree")
vim.keymap.set("n", "<leader>u", require("undotree").open)
-- ui2 (experimental)
require("vim._core.ui2").enable({ enable = true, msg = { target = "msg" } })

-- simgle config / no config
require("supermaven-nvim").setup({})
require("colorizer").setup()
require("mini.pairs").setup()
require("mini.surround").setup()
require("mini.diff").setup()
require("mini.icons").setup()
require("which-key").setup({
    preset = "helix",
    delay = 500,
})
