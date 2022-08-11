local M = {}

local sep_style = require("core.ui.statusline.separators").styles.default
local sep_l = sep_style[2]

function M.setup()
  local filename = vim.fn.expand("%:t")

  if filename ~= "NvimTree_1" and filename ~= "" then
    local icon = ""
    local filetype = (vim.bo.filetype ~= "" and vim.bo.filetype) or filename

    local status_ok, devicons = pcall(require, "nvim-web-devicons")
    if status_ok then
      local devicon = devicons.get_icon(filename)
      icon = (devicon ~= nil and devicon) or icon
    end

    local fmt = "%#ST_FiletypeSep#" .. sep_l .. "%#ST_FiletypeIcon#" .. icon .. " %#ST_Filetype# " .. filetype .. " "
    return fmt
  end

  return ""
end

return M
