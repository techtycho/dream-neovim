local M = {}

require "core.ui.statusline.modules"

function M.getMode(mode)
  if mode == "n" then
    return "NORMAL"
  else
    return "INSERT"
  end
end

function M.statusline()
  return M.getMode(vim.api.nvim_get_mode().mode)
end

vim.opt.statusline = "%!v:lua.require('core.ui.statusline').statusline()"

return M
