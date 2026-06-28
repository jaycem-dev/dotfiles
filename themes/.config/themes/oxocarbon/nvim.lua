vim.pack.add({
    { src = "https://github.com/nyoom-engineering/oxocarbon.nvim" },
})

vim.cmd("colorscheme oxocarbon")

vim.uv.new_signal():start("sigusr1", vim.schedule_wrap(function()
    package.loaded["plugins.theme"] = nil
    package.loaded["fzf-lua"] = nil
    package.loaded["oxocarbon"] = nil
    require("plugins.theme")
end))
