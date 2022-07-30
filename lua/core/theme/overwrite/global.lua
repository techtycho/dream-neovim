local colors = require("core.theme.colors")

local highlight = {
  -- Disable cursor line highlight
  CursorLine = { guibg="NONE" },
  -- Disable bold text
  Visual = { cterm="NONE", gui="NONE" },
  PmenuSel = { cterm="NONE", gui="NONE" },
  TSConstructor = { cterm="NONE", gui="NONE" },
  Statement = { cterm="NONE", gui="NONE" },
  Type = { cterm="NONE", gui="NONE" },
  TabLineSel = { cterm="NONE", gui="NONE" },
}

for k, v in pairs(highlight) do
  colors.add_color(k, v)
end

colors.update_colors()
