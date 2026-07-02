local M = {}

---@param url string
function M.webapp_class(url)
    return "brave-" .. url .. "__-Default"
end

function M.webapp_cmd(url)
    return "brave --app=https://" .. url
end

---@param app table
---@return function
function M.spawn_or_focus(app)
    return function()
        local w = hl.get_window("class:" .. (app.class or app.cmd))
        if w then
            hl.dispatch(hl.dsp.focus({ window = w }))
        else
            hl.dispatch(hl.dsp.exec_cmd(app.cmd))
        end
    end
end

---@param url string
---@return function
function M.spawn_or_focus_webapp(url)
    return M.spawn_or_focus({
        cmd = M.webapp_cmd(url),
        class = M.webapp_class(url),
    })
end

---@param scratchpad_name string
---@param class string
---@param cmd string|nil
---@return function
function M.scratchpad(scratchpad_name, class, cmd)
    cmd = cmd or class
    return function()
        local w = hl.get_window("class:" .. class)
        if w then
            hl.dispatch(hl.dsp.workspace.toggle_special(scratchpad_name))
        else
            hl.dispatch(hl.dsp.exec_cmd(cmd, { workspace = scratchpad_name }))
            hl.dispatch(hl.dsp.workspace.toggle_special(scratchpad_name))
        end
    end
end

---@param url string
---@return function
function M.spawn_or_focus_url(url)
    return function()
        hl.dispatch(hl.dsp.exec_cmd("brave --focus='https://" .. url .. "/*' https://" .. url))
    end
end

function M.spawn_or_focus_tui(app)
    local class = app.class or app.cmd
    local cmd = "kitty --app-id " .. class .. " " .. app.cmd
    return M.spawn_or_focus({ cmd = cmd, class = app.class or app.cmd })
end

return M
