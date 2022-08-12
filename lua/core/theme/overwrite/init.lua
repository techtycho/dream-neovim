require "core.theme.overwrite.global"

local supported_colorschemes = {
  "github_dark_default",
  "onedark",
}

for _, i in ipairs(supported_colorschemes) do
  if colorscheme == i then
    require("core.theme.overwrite." .. colorscheme)
    -- require("core.ide.completion.lsp.handlers").setup()
  end
end
