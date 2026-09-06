vim.pack.add({ "https://github.com/nvim-lualine/lualine.nvim" })

local function root_dir()
    return "󰉋 " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
end

local function macro_rec()
    local reg = vim.fn.reg_recording()
    if reg == "" then
        return ""
    end
    return "%#@Macro#󰝥 rec: " .. reg .. "%*"
end

require("lualine").setup({
    options = { section_separators = "", component_separators = "" },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff" },
        lualine_c = { "filename", "diagnostics" },
        lualine_x = { macro_rec, "filetype" },
        lualine_y = { root_dir },
        lualine_z = { "progress" },
    },
})
