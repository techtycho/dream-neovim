local M = {}

M.mode = require("core.ui.statusline.modules.mode").setup
M.filename = require("core.ui.statusline.modules.filename").setup

return M
