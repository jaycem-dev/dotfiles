vim.pack.add({
    { src = "https://github.com/NeogitOrg/neogit" },
    { src = "https://github.com/sindrets/diffview.nvim" },
})

vim.keymap.set("n", "<leader>gg", "<cmd>Neogit<cr>", { desc = "Open Neogit UI" })
