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

---- Old way of doing things ----
-- vim.api.nvim_exec([[
-- function! StatusLine()
--   let l:mode = mode()
--   let l:out = luaeval('require("core.ui.statusline").getMode(_A)', l:mode)
--   return l:out
-- endfunction
-- set statusline=%{StatusLine()}
-- ]], true)

vim.opt.statusline = "%!v:lua.require('core.ui.statusline').hello()"

return M
