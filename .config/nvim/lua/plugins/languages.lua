-- LSP, Treesitter, Formatters, Linters --
vim.pack.add({
	{
		src = "https://github.com/neovim/nvim-lspconfig",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/nvim-treesitter/nvim-treesitter",
		version = "main",
	},
	{
		src = "https://github.com/stevearc/conform.nvim",
		version = vim.version.range("*"),
	},
	{
		src = "https://github.com/mfussenegger/nvim-lint",
		version = vim.version.range("*"),
	},
})

-- LSP --
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

-- Treesitter --
local ts_parsers = {
	"javascript",
	"typescript",
	"tsx",
	"astro",
	"lua",
	"html",
	"css",
	"bash",
	"python",
	"rust",
	"go",
}

require("nvim-treesitter").setup({
	-- fix for nixos, the dir needs to be set so it doesn't use the /store which has permissions issues.
	install_dir = vim.fn.stdpath("data") .. "/site",
	install = ts_parsers,
})

-- Formatters --
require("conform").setup({
	formatters_by_ft = {
		python = { "ruff" },
		htmldjango = { "djlint" },
		javascript = { "prettier" },
		astro = { "prettier" },
		typescript = { "prettier" },
		typescriptreact = { "prettier" },
		javascriptreact = { "prettier" },
		css = { "prettier" },
		scss = { "prettier" },
		html = { "prettier" },
		sh = { "shfmt" },
		zsh = { "shfmt" },
		nix = { "nixfmt" },

		-- to be reviewed
		markdown = { "prettier" },
		json = { "prettier" },
		jsonc = { "prettier_jsonc" },
		lua = { "stylua" },
		-- TODO: add the rest of ft
	},
	format_after_save = {
		lsp_format = "fallback",
	},
	formatters = {
		shfmt = {
			prepend_args = { "-i", "4" },
		},
		prettier = {
			append_args = { "--tab-width", "4" },
		},
		prettier_jsonc = {
			command = "prettier",
			append_args = { "--tab-width", "4" },
			args = {
				"--stdin-filepath",
				"$FILENAME",
				"--trailing-comma",
				"none",
			},
		},
	},
})

-- Linters --
local lint = require("lint")

lint.linters.shellcheck.args = {
	"-x", -- follow sourced files
}

lint.linters_by_ft = {
	python = {
		"ruff",
	},
	javascript = {
		"eslint",
	},
	typescript = {
		"eslint",
	},
	sh = {
		"shellcheck",
	},
}

vim.api.nvim_create_autocmd({ "BufWritePost" }, {
	callback = function()
		-- try_lint without arguments runs the linters defined in `linters_by_ft`
		-- for the current filetype
		require("lint").try_lint(nil, {
			-- ignore_errors = true,
		})
	end,
})
