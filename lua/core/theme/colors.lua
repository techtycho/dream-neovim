local M = {}

-- Colors
M.dark_gray = "#42464E"
M.very_dark_gray = "#12161E"
M.blue = "#569CD6"

-- UI Colors
M.highlight = {
  -- Neovim UI --
  WinSeparator           =    { guifg = M.dark_gray, guibg = "NONE" },
  IndentBlanklineChar    =    { guifg = M.very_dark_gray },
  FloatBorder            =    { guifg = M.dark_gray, guibg = "NONE" },
  TelescopeBorder        =    { guifg = M.dark_gray, guibg = "NONE" },
  PmenuThumb             =    { guibg = M.dark_gray },
  NormalFloat            =    { guibg = "#" .. GetColorscheme("Normal").background },
}

function M.add_color(k, v, p)
  p = p or ""
  local guifg = v.guifg and p .. v.guifg or nil
  local guibg = v.guibg and p .. v.guibg or nil
  local gui   = v.gui   and v.gui   or nil
  local cterm = v.cterm and v.cterm or nil

  M.highlight[k] = { guibg = guibg, guifg = guifg, gui = gui, cterm = cterm }
end

function M.update_colors()
  for k, v in pairs(M.highlight) do
    local guifg = v.guifg and ("guifg=" .. v.guifg .. " ") or ""
    local guibg = v.guibg and ("guibg=" .. v.guibg .. " ") or ""
    local gui   = v.gui   and ("gui="   .. v.gui   .. " ") or ""
    local cterm = v.cterm and ("cterm=" .. v.cterm .. " ") or ""

    vim.cmd("highlight! " .. k .. " " .. guifg .. guibg .. gui .. cterm)
  end
end

M.update_colors()

return M
