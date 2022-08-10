local M = {}
local module = require("core.ui.statusline.modules")

function M.statusline()
  return table.concat {
    module.mode(),
    module.filename(),
    module.git(),

    "%=",

    module.diagnostics(),
    module.filetype(),
    module.cwd(),
  }
end

vim.opt.statusline = "%!v:lua.require('core.ui.statusline').statusline()"

return M
