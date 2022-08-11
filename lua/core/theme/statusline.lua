local M = {}
local colors = require("core.theme.colors")

M.opts = {
  light = 1,
  dark = 2,
}

M.normal = "#13161d"
M.normal_fg = "#8c93a0"
M.mode_sep_color = "#292a37"
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
M.filename = "#1c1d2b"
M.filename_fg = "#afb6c4"
M.error = "#" .. GetColorscheme("DiagnosticError").foreground
M.warn = "#" .. GetColorscheme("DiagnosticWarn").foreground
M.hint = "#" .. GetColorscheme("DiagnosticHint").foreground
M.info = "#" .. GetColorscheme("DiagnosticInfo").foreground
M.cwd_icon = "#cf433a"
M.filetype_icon = "#c58f37"
M.user_icon = "#35a352"

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
    ["ST_ModeNormalSep"]   = { guibg = M.mode_sep_color, guifg = M.modes.normal },
    ["ST_ModeInsertSep"]   = { guibg = M.mode_sep_color, guifg = M.modes.insert },
    ["ST_ModeVisualSep"]   = { guibg = M.mode_sep_color, guifg = M.modes.visual },
    ["ST_ModeCommandSep"]  = { guibg = M.mode_sep_color, guifg = M.modes.command },
    ["ST_ModeSelectSep"]   = { guibg = M.mode_sep_color, guifg = M.modes.select },
    ["ST_ModeReplaceSep"]  = { guibg = M.mode_sep_color, guifg = M.modes.replace },
    ["ST_ModeTerminalSep"] = { guibg = M.mode_sep_color, guifg = M.modes.terminal },
    -- Other Separators --
    ["ST_OtherSep"] = { guibg = M.filename, guifg = M.mode_sep_color },
    -- Filename --
    ["ST_Filename"] = { guibg = M.filename, guifg = M.filename_fg },
    ["ST_FilenameSep"] = { guibg = M.normal, guifg = M.filename },
    -- Normal --
    ["ST_Normal"] = { guibg = M.normal, guifg = M.normal_fg },
    -- CWD
    ["ST_CwdSep"] = { guibg = M.filename, guifg = M.cwd_icon },
    ["ST_CwdIcon"] = { guibg = M.cwd_icon, guifg = M.normal },
    -- Diagnostics
    ["ST_Error"] = { guifg = M.error, guibg = M.normal },
    ["ST_Warn"]  = { guifg = M.warn, guibg = M.normal },
    ["ST_Hint"]  = { guifg = M.hint, guibg = M.normal },
    ["ST_Info"]  = { guifg = M.info, guibg = M.normal },
    -- Filetype
    ["ST_FiletypeSep"] = { guifg = M.filetype_icon, guibg = M.normal },
    ["ST_FiletypeIcon"] = { guifg = M.normal, guibg = M.filetype_icon },
    ["ST_Filetype"] = { guifg = M.filename_fg, guibg = M.filename },
    -- User
    ["ST_UserSep"] = { guifg = M.user_icon, guibg = M.filename },
    ["ST_UserIcon"] = { guifg = M.normal, guibg = M.user_icon },
    ["ST_User"] = { guifg = M.user_icon, guibg = M.filename },
  }

  for k, v in pairs(highlight) do
    colors.add_color(k, v)
  end

  colors.update_colors()
end

-- Update the statusline theme
M.update_colors()

return M
