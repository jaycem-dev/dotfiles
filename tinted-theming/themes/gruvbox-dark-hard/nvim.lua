vim.pack.add({
    "https://github.com/ellisonleao/gruvbox.nvim",
})

require("gruvbox").setup({
    contrast = "hard", -- can be "hard", "soft" or empty string
    dim_inactive = false,
    transparent_mode = true,
    italic = {
        strings = false,
        emphasis = false,
        comments = false,
        folds = false,
    },
})
vim.cmd("colorscheme gruvbox")
