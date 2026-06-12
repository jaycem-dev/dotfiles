vim.pack.add({
    { src = "https://github.com/stevearc/conform.nvim", version = vim.version.range("*") },
})

require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        javascript = { "oxfmt" },
        typescript = { "oxfmt" },
        javascriptreact = { "oxfmt" },
        typescriptreact = { "oxfmt" },
        json = { "oxfmt" },
        jsonc = { "oxfmt" },
        yaml = { "oxfmt" },
        toml = { "oxfmt" },
        html = { "oxfmt" },
        css = { "oxfmt" },
        scss = { "oxfmt" },
        markdown = { "oxfmt" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
