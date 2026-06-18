local M = {}

---@param url string
function M.webapp_class(url)
    return "brave-" .. url .. "__-Default"
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
        cmd = "brave --app=https://" .. url,
        class = M.webapp_class(url),
    })
end

function M.spawn_or_focus_tui(app)
    local class = app.class or app.cmd
    local cmd = "kitty --app-id " .. class .. " " .. app.cmd
    return M.spawn_or_focus({ cmd = cmd, class = app.class or app.cmd })
end

return M
