-- Switch Neovim root working dir to a different project, saving/restoring sessions
-- It will use whatever picker registers itself with vim.ui.select
-- TODO: change to plugin for session
local dirs = { "~/Projects" }

local function session_path(project_path)
    return vim.g.session_dir .. "/" .. vim.fn.sha256(project_path) .. ".vim"
end

local function save_session(project_path)
    if project_path == vim.fn.expand("~") then
        return
    end
    vim.fn.mkdir(vim.g.session_dir, "p")
    vim.cmd.mksession({ bang = true, args = { session_path(project_path) } })
end

local function switch_to_project(project_path)
    save_session(vim.fn.getcwd())
    vim.cmd("silent! %bd!")
    vim.cmd.cd(project_path)
    local file = session_path(project_path)
    if vim.fn.filereadable(file) == 1 then
        vim.cmd.source(file)
    else
        vim.cmd.edit(".")
        save_session(project_path)
    end
end

vim.api.nvim_create_user_command("Projects", function()
    local bases = vim.tbl_map(vim.fn.expand, dirs)
    local cmd = { "fd", ".", "--type", "d", "--max-depth", "1", "--absolute-path" }
    vim.list_extend(cmd, bases)
    local paths = vim.fn.systemlist(cmd)

    local items = {}
    for _, path in ipairs(paths) do
        path = vim.fs.normalize(path) -- fd appends trailing slash
        table.insert(items, { path = path, text = vim.fn.fnamemodify(path, ":~") })
    end

    vim.ui.select(items, {
        prompt = "Change Project > ",
        format_item = function(item)
            return item.text
        end,
    }, function(item)
        if item ~= nil then
            switch_to_project(item.path)
        end
    end)
end, { desc = "Find projects" })

vim.keymap.set("n", "<leader>fp", "<cmd>Projects<CR>", { desc = "Find projects" })

vim.api.nvim_create_autocmd("VimLeavePre", {
    desc = "Save session on exit",
    callback = function()
        save_session(vim.fn.getcwd())
    end,
})
