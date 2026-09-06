-- TODO: use release tag when there's a new release
vim.pack.add({ "https://github.com/stevearc/conform.nvim" })

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
        nix = { "nixfmt" },
    },
    format_on_save = {
        -- These options will be passed to conform.format()
        timeout_ms = 500,
        lsp_format = "fallback",
    },
})
