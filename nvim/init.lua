-- modules
require("config.options")
require("config.keymaps")
require("config.autocmd")

-- plugins
require("plugins.misc")
require("plugins.treesitter")
require("plugins.lsp")
require("plugins.picker")
require("plugins.flash")
require("plugins.completion")
require("plugins.formatter")
require("plugins.statusline")

-- Keep single quotes: Noctalia's apply.sh checks for this exact string.
-- stylua: ignore
local ok, matugen = pcall(require, 'matugen')
if ok then
    matugen.setup()
end
