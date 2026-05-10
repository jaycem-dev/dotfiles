-- native lsp completion
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("my.lsp", {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method("textDocument/completion") then
			-- Optional: trigger autocompletion on EVERY keypress. May be slow!
			local unwanted = { ["{"] = true, ["}"] = true, ["["] = true, ["]"] = true, ["("] = true, [")"] = true }
			local chars = {}
			for i = 32, 126 do
				local char = string.char(i)
				if not unwanted[char] then
					table.insert(chars, char)
				end
			end
			client.server_capabilities.completionProvider.triggerCharacters = chars

			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})

-- Highlight when yanking (copying) text
--  See `:help vim.hl.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	group = vim.api.nvim_create_augroup("highlight-yank", { clear = true }),
	callback = function()
		vim.hl.on_yank()
	end,
})

-- markdown task checkboxes
vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		-- Toggle checkbox under cursor
		vim.keymap.set("n", "<leader>c", function()
			local line = vim.api.nvim_get_current_line()
			if line:match("%[ %]") then
				line = line:gsub("%[ %]", "[x]", 1)
			elseif line:match("%[x%]") then
				line = line:gsub("%[x%]", "[ ]", 1)
			end
			vim.api.nvim_set_current_line(line)
		end, { buffer = true, desc = "Toggle markdown task checkbox" })

		-- Create markdown list from selection
		vim.keymap.set("v", "<leader>l", function()
			local s = vim.fn.getpos("'<")[2]
			local e = vim.fn.getpos("'>")[2]
			if s > e then
				s, e = e, s
			end
			for lnum = s, e do
				local line = vim.fn.getline(lnum)
				if line:match("%S") then
					vim.fn.setline(lnum, "- " .. line)
				end
			end
		end, { buffer = true, desc = "Create markdown list from selection" })

		-- Toggle checkbox for visual selection
		vim.keymap.set("v", "<leader>c", function()
			local s = vim.fn.getpos("'<")[2]
			local e = vim.fn.getpos("'>")[2]
			if s > e then
				s, e = e, s
			end

			for lnum = s, e do
				local line = vim.fn.getline(lnum)
				if line:match("%S") and not line:match("%[.%]") then
					vim.fn.setline(lnum, "- [ ] " .. line)
				end
			end
		end, { buffer = true, desc = "Create markdown checkboxes from selection" })
	end,
})

-- fff.nvim autodownload binary, must be loaded before package install
vim.api.nvim_create_autocmd("PackChanged", {
	group = vim.api.nvim_create_augroup("fff-nvim-pack-hooks", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "fff.nvim" and (kind == "install" or kind == "update") then
			vim.cmd.packadd("fff.nvim")
			require("fff.download").download_or_build_binary()
		end
	end,
})
