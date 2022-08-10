local M = {}

local sep_style = require("core.ui.statusline.separators").styles.default
local sep_l = sep_style[2]

function M.setup()
  local dir_icon = "%#ST_CwdIcon#" .. " "
  local dir_name = "%#ST_Filename# " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "

  local fmt = (vim.o.columns > 85 and ("%#ST_CwdSep#" .. sep_l .. dir_icon .. dir_name)) or ""

  return fmt
end

return M
