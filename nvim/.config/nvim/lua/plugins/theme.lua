vim.pack.add({
    { src = "https://github.com/rose-pine/neovim", version = vim.version.range("*") },
})

vim.cmd("colorscheme rose-pine")

vim.uv.new_signal():start("sigusr1", vim.schedule_wrap(function()
    package.loaded["plugins.theme"] = nil
    package.loaded["fzf-lua"] = nil
    package.loaded["rose-pine"] = nil
    require("plugins.theme")
end))
