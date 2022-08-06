local M = {}
local colors = require("core.theme.colors")

M.mode_sep_color = GetColorscheme("CursorColumn").background
M.modes = {
  normal = "#1155a4",
  insert = "#a45511",
  visual = "#55a411",
  command = "#35a471",
  select = "#87901f",
  replace = "#cf2513",
  terminal = "#159d4f",
}

function M.update_colors()
  local highlight = {
    -- Modes --
    ["ST_ModeNormal"]   = { guibg = M.modes.normal },
    ["ST_ModeInsert"]   = { guibg = M.modes.insert },
    ["ST_ModeVisual"]   = { guibg = M.modes.visual },
    ["ST_ModeCommand"]  = { guibg = M.modes.command },
    ["ST_ModeSelect"]   = { guibg = M.modes.select },
    ["ST_ModeReplace"]  = { guibg = M.modes.replace },
    ["ST_ModeTerminal"] = { guibg = M.modes.terminal },
    -- Mode Separators --
    ["ST_ModeNormalSep"]   = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.normal },
    ["ST_ModeInsertSep"]   = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.insert },
    ["ST_ModeVisualSep"]   = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.visual },
    ["ST_ModeCommandSep"]  = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.command },
    ["ST_ModeSelectSep"]   = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.select },
    ["ST_ModeReplaceSep"]  = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.replace },
    ["ST_ModeTerminalSep"] = { guibg = "#" .. M.mode_sep_color, guifg = M.modes.terminal },
    -- Other Separators --
    ["ST_OtherSep"] = { guibg = "#" .. GetColorscheme("Normal").background, guifg = "#" .. GetColorscheme("CursorColumn").background },
  }

  for k, v in pairs(highlight) do
    colors.add_color(k, v)
  end

  colors.update_colors()
end

-- Update the statusline theme
M.update_colors()

return M
