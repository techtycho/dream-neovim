local colors = require("core.theme.colors")

-- Kind Colors
local kind_colors = {
  Snippet = GetColorscheme("Identifier").foreground,
  Text = GetColorscheme("Comment").foreground,
  Variable = GetColorscheme("Statement").foreground,
  Keyword = GetColorscheme("String").foreground,
  Field = GetColorscheme("Statement").foreground,
  Class = GetColorscheme("Type").foreground,
  Constant = GetColorscheme("Type").foreground,
}

colors.highlight["CmpItemAbbrMatch"] = { guifg = colors.blue, guibg = "NONE", cterm = "NONE", gui = "NONE" } -- Matching abbr

for k, v in pairs(kind_colors) do
  colors.highlight["CmpItemKind" .. k] = { guifg = "#" .. v  }
end
