vim.opt.statusline = "%!v:lua.statusline()"

local function root_dir()
    local dir = vim.fn.getcwd()
    return "%#Directory#󰉋 " .. vim.fn.fnamemodify(dir, ":t") .. "%*"
end

local function git_branch()
    local head = vim.b.gitsigns_head
    if head and head ~= "" then
        return "%#NeogitBranch#󰘬 " .. head .. "%*"
    end
    return ""
end

local function macro_status()
    local reg = vim.fn.reg_recording()
    if reg ~= "" then
        return "%#Macro#󰑊 rec:" .. reg .. "%*"
    end
    return reg
end

-- removes bg from diagnostics hl
for _, sev in ipairs({ "Error", "Warn", "Info", "Hint" }) do
    local hl = vim.api.nvim_get_hl(0, { name = "DiagnosticFloating" .. sev })
    hl.bg = nil
    vim.api.nvim_set_hl(0, "DiagnosticSign" .. sev, hl)
end

function _G.statusline()
    -- %= separates sections, %* resets hl groups
    return table.concat({
        "%#MiniStatuslineModeOther# " .. vim.api.nvim_get_mode().mode:upper() .. " %*",
        root_dir(),
        git_branch(),
        macro_status(),
        "%=",
        "%<",
        "%f",
        "%m",
        "%h",
        "%=",
        vim.ui.progress_status(),
        vim.diagnostic.status(),
        "%#String#" .. "%y" .. "%*",
        "%p%% %l:%c ",
    }, " ")
end
