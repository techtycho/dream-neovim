local colors = require("core.theme.colors")

local highlight = {
  DiagnosticVirtualTextError = { guifg = "#bf4454", guibg = "#3f2d35" },
  DiagnosticVirtualTextWarn  = { guifg = "#cf912d", guibg = "#333232" },
  DiagnosticVirtualTextHint  = { guifg = "#29a8bf", guibg = "#353e4f" },
  DiagnosticVirtualTextInfo  = { guifg = "#29a8bf", guibg = "#353e4f" },
  IndentBlanklineChar        = { guifg = colors.very_dark_gray },
}

for k, v in pairs(highlight) do
  colors.add_color(k, v)
end

colors.update_colors()
