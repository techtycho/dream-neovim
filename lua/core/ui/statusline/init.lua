local M = {}
local module = require("core.ui.statusline.modules")

function M.statusline()
  return table.concat {
    module.mode(),
    module.filename(),
  }
end

vim.opt.statusline = "%!v:lua.require('core.ui.statusline').statusline()"

return M
