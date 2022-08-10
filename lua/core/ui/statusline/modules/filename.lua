local M = {}

local icons = require("core.ui.icons")
local sep_style = require("core.ui.statusline.separators").styles.default
local sep_r = sep_style[1]

function M.setup()
  local icon = ""
  local filename = vim.fn.expand("%:t")

  if filename ~= "" then
    local status_ok, devicons = pcall(require, "nvim-web-devicons")
    if status_ok then
      local devicon = devicons.get_icon(filename)
      icon = (devicon ~= nil and devicon) or icon
    end
  else
    filename = "[No Name]"
  end

  for k, v in pairs(icons.special) do
    if filename == k then
      icon = v[1]
      filename = v[2]
    end
  end

  local fmt = "%#ST_Filename#" .. icon .. " " .. filename .. " %#ST_FilenameSep#" .. sep_r .. "%#ST_Normal#"

  return fmt
end

return M
