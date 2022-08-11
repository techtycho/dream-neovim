local M = {}

M.mode = require("core.ui.statusline.modules.mode").setup
M.filename = require("core.ui.statusline.modules.filename").setup
M.git = require("core.ui.statusline.modules.git").setup
M.diagnostics = require("core.ui.statusline.modules.diagnostics").setup
M.filetype = require("core.ui.statusline.modules.filetype").setup
M.cwd = require("core.ui.statusline.modules.cwd").setup
M.user = require("core.ui.statusline.modules.user").setup

return M
