vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", version = vim.version.range("*") },
})

require("catppuccin").setup({
    transparent_background = true,
})
vim.cmd("colorscheme catppuccin-mocha")
