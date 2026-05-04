local M = {}

local mode_names = {
	n = "NORMAL",
	v = "VISUAL",
	V = "V-LINE",
	["\22"] = "V-BLOCK",
	i = "INSERT",
	R = "REPLACE",
	c = "COMMAND",
	t = "TERMINAL",
}

local function current_mode()
	return mode_names[vim.api.nvim_get_mode().mode] or "UNKNOWN"
end

local function git_branch()
	local head = vim.b.gitsigns_head
	if head and head ~= "" then
		return "󰘬 " .. head
	end
end

local function macro_status()
	local reg = vim.fn.reg_recording()
	if reg == "" then
		return
	end
	return "@" .. reg
end

function M.render()
	local branch = git_branch() or ""
	local macro = macro_status() or ""
	local diagnostics = vim.diagnostic.status() or ""
	local left_section = table.concat({
		"%#TelescopePreviewTitle# " .. current_mode() .. " %*",
		"%#gitcommitBranch#" .. branch .. "%*",
		macro,
	}, " ")
	local center_section = table.concat({
		"%<",
		"%q",
		"%f",
		"%m",
		"%h",
	}, " ")
	local right_section = table.concat({
		diagnostics,
		"%p%%",
		"%#String#" .. "%y" .. "%*",
		"%l:%c ",
	}, " ")

	return table.concat({
		left_section,
		"%=",
		center_section,
		"%=",
		right_section,
	})
end

_G.custom_statusline = function()
	return M.render()
end

return M
