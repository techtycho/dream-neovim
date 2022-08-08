local M = {}
local colors = require("core.theme.colors")

M.opts = {
  light = 1,
  dark = 2,
}

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

M.modes_fg = {
  all = M.opts.light,
}

local function getFg(fg)
  if fg == M.opts.light then
    return "#" .. GetColorscheme("Normal").foreground
  elseif fg == M.opts.dark then
    return "#" .. GetColorscheme("StatusLine").foreground
  else
    return
  end
end

function M.update_colors()
  local normal_fg = M.modes_fg.normal or M.modes_fg.all
  local insert_fg = M.modes_fg.insert or M.modes_fg.all
  local visual_fg = M.modes_fg.visual or M.modes_fg.all
  local command_fg = M.modes_fg.command or M.modes_fg.all
  local select_fg = M.modes_fg.select or M.modes_fg.all
  local replace_fg = M.modes_fg.replace or M.modes_fg.all
  local terminal_fg = M.modes_fg.terminal or M.modes_fg.all

  local highlight = {
    -- Modes --
    ["ST_ModeNormal"]   = { guibg = M.modes.normal,   guifg = getFg(normal_fg) },
    ["ST_ModeInsert"]   = { guibg = M.modes.insert,   guifg = getFg(insert_fg) },
    ["ST_ModeVisual"]   = { guibg = M.modes.visual,   guifg = getFg(visual_fg) },
    ["ST_ModeCommand"]  = { guibg = M.modes.command,  guifg = getFg(command_fg) },
    ["ST_ModeSelect"]   = { guibg = M.modes.select,   guifg = getFg(select_fg) },
    ["ST_ModeReplace"]  = { guibg = M.modes.replace,  guifg = getFg(replace_fg) },
    ["ST_ModeTerminal"] = { guibg = M.modes.terminal, guifg = getFg(terminal_fg) },
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
