local colors = require("core.theme.colors")

local highlight = {
  TelescopeBorder = { guibg="#1A1A1A" },
  TelescopeNormal = { guibg="#1A1A1A" },
  TelescopeResultsBorder = { guibg="#1A1A1A" },
  TelescopePromptBorder = { guibg="#333333" },
  TelescopePromptNormal = { guibg="#333333" },
  TelescopePreviewNormal = { guibg="#1D1D1D" },
  TelescopePreviewBorder = { guibg="#1D1D1D" },
  TelescopePreviewTitle = { guifg="#222222", guibg="#" .. GetColorscheme("String").foreground },
  TelescopePromptTitle = { guifg="#222222", guibg="#" .. GetColorscheme("Special").foreground },
  TelescopeResultsTitle = { guifg="#222222", guibg="#" .. GetColorscheme("Function").foreground },
  TelescopeSelection = { guibg="#333333" },
}

for k, v in pairs(highlight) do
  colors.add_color(k, v)
end

colors.update_colors()
