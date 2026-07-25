local M = {}

function M.get_session_path(project_path)
    return vim.g.session_dir .. "/" .. project_path:gsub("/", "%%") .. ".vim"
end

function M.save_session(project_path)
    project_path = project_path or vim.fn.getcwd()
    vim.fn.mkdir(vim.g.session_dir, "p")
    local session_file = M.get_session_path(project_path)
    vim.cmd("mksession! " .. vim.fn.fnameescape(session_file))
    vim.notify("Session saved: " .. session_file)
end

function M.restore_session(project_path)
    project_path = project_path or vim.fn.getcwd()
    local session_file = M.get_session_path(project_path)
    if vim.fn.filereadable(session_file) == 1 then
        vim.cmd("silent! source " .. vim.fn.fnameescape(session_file))
        return true
    end
    return false
end

function M.close_all_buffers()
    vim.cmd("silent! %bd!")
end

function M.switch_to_project(project_path)
    local current_dir = vim.fn.getcwd()
    if current_dir ~= vim.fn.expand("~") then
        M.save_session(current_dir)
    end
    M.close_all_buffers()
    vim.cmd("cd " .. project_path)
    if not M.restore_session(project_path) then
        vim.cmd("edit .")
        M.save_session(project_path)
    end
end

return M
