local M = {}
local sep_style = require("core.ui.statusline.separators").styles.default
local sep_r = sep_style[1]

function M.setup()
  local icon = ""
  local filename = vim.fn.expand("%:t")

  if filename ~= "Empty " then
    local status_ok, devicons = pcall(require, "nvim-web-devicons")
    if status_ok then
      local devicon = devicons.get_icon(filename)
      icon = (devicon ~= nil and devicon) or icon
    end
  end

  local fmt = "%#ST_Filename#" .. icon .. " " .. filename .. " %#ST_FilenameSep#" .. sep_r .. "%#Normal#"

  return fmt
end

return M
