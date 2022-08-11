local M = {}
local module = require("core.ui.statusline.modules")

function M.statusline()
  return table.concat {
    module.mode(),
    module.filename(),
    module.git(),

    "%=",

    module.diagnostics(),
    module.stats(),
    module.filetype(),
    module.cwd(),
    module.user(),
  }
end

vim.opt.statusline = "%!v:lua.require('core.ui.statusline').statusline()"

return M
