local M = {}

local os = require("os")
local sep_style = require("core.ui.statusline.separators").styles.default
local sep_l = sep_style[2]

function M.setup()
  local fmt = "%#ST_UserSep#" .. sep_l .. "%#ST_UserIcon# %#ST_User# " .. os.getenv("USER") .. " %#ST_Normal#"
  return fmt
end

return M
