-- Set the colorscheme
_G.colorscheme = "github_dark_default" -- Default is `darkplus`

-- Theme Configurations --
-- Catppuccin
vim.g.catppuccin_flavour = "mocha"
-- Onedark
require('onedark').setup {
  style = 'dark', -- Style is set to dark
}
require('onedark').load()

-- Set the colorscheme and handle possible exceptions
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end
