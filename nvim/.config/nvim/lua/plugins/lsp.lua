vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		version = vim.version.range("*"),
	},
})

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
		},
	},
})

vim.lsp.enable("pyright")
vim.lsp.enable("gopls")
vim.lsp.enable("ts_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("bashls")
vim.lsp.enable("astro")
vim.lsp.enable("html")
vim.lsp.enable("tailwindcss")
vim.lsp.enable("cssls")
vim.lsp.enable("marksman")
vim.lsp.enable("lua_ls")
vim.lsp.enable("taplo")
vim.lsp.enable("yamlls")
vim.lsp.enable("nil_ls") -- nix lsp
