local M = {}

M.mode = require("core.ui.statusline.modules.mode").setup
M.filename = require("core.ui.statusline.modules.filename").setup
M.git = require("core.ui.statusline.modules.git").setup

return M
