local colors = require("core.theme.colors")

local highlight = {
  DiagnosticVirtualTextError = { guifg = "#bf4454", guibg = "#3f2d35" },
  DiagnosticVirtualTextWarn  = { guifg = "#cf912d", guibg = "#333232" },
  DiagnosticVirtualTextHint  = { guifg = "#29a8bf", guibg = "#353e4f" },
  DiagnosticVirtualTextInfo  = { guifg = "#29a8bf", guibg = "#353e4f" },
  IndentBlanklineChar        = { guifg = colors.very_dark_gray },
  TelescopeBorder            = { guibg = "#0d1318" },
  TelescopeNormal            = { guibg = "#0b1015" },
  TelescopeResultsBorder     = { guibg = "#0b1015" },
  TelescopePromptBorder      = { guibg = "#11181c" },
  TelescopePromptNormal      = { guibg = "#11181c" },
  TelescopePreviewNormal     = { guibg = "#0d1318" },
  TelescopePreviewBorder     = { guibg = "#0d1318" },
  TelescopePreviewTitle      = { guifg = "#222222", guibg = "#" .. GetColorscheme("String").foreground },
  TelescopePromptTitle       = { guifg = "#222222", guibg = "#" .. GetColorscheme("Special").foreground },
  TelescopeResultsTitle      = { guifg = "#222222", guibg = "#" .. GetColorscheme("Function").foreground },
  TelescopeSelection         = { guibg = "#1d232a" },
  TelescopeMatching          = { cterm = "NONE", gui = "NONE" },
  BufferLineFill             = { guibg = "#14181f" },
  BufferLineBackground       = { guibg = "#14181f" },
  BufferLineCloseButton      = { guibg = "#14181f" },
  BufferLineCloseButtonSelected =  { guibg = "#0d1117" },
  BufferLineModified         = { guibg = "#14181f" },
  BufferLineModifiedSelected = { guibg = "#0d1117" },
  BufferLineSeparator        = { guifg = "#14181f", guibg = "#14181f" },
}

for k, v in pairs(highlight) do
  colors.add_color(k, v)
end

colors.update_colors()

-- Statusline
