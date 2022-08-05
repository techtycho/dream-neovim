local M = {}

-- Modes and their names are Copied from Lualine, https://github.com/nvim-lualine/lualine.nvim/blob/master/lua/lualine/utils/mode.lua
local modes = {
  ["n"]      = { "NORMAL", "ST_ModeNormal" },
  ["no"]     = { "O-PENDING", "ST_ModeNormal" },
  ["nov"]    = { "O-PENDING", "ST_ModeNormal" },
  ["noV"]    = { "O-PENDING", "ST_ModeNormal" },
  ["no\22"]  = { "O-PENDING", "ST_ModeNormal" },
  ["niI"]    = { "NORMAL", "ST_ModeNormal" },
  ["niR"]    = { "NORMAL", "ST_ModeNormal" },
  ["niV"]    = { "NORMAL", "ST_ModeNormal" },
  ["nt"]     = { "NORMAL", "ST_ModeNormal" },
  ["ntT"]    = { "NORMAL", "ST_ModeNormal" },
  ["v"]      = { "VISUAL", "ST_ModeVisual" },
  ["vs"]     = { "VISUAL", "ST_ModeVisual" },
  ["V"]      = { "V-LINE", "ST_ModeVisual" },
  ["Vs"]     = { "V-LINE", "ST_ModeVisual" },
  ["\22"]    = { "V-BLOCK", "ST_ModeVisual" },
  ["\22s"]   = { "V-BLOCK", "ST_ModeVisual" },
  ["s"]      = { "SELECT", "ST_ModeSelect" },
  ["S"]      = { "S-LINE", "ST_ModeSelect" },
  ["\19"]    = { "S-BLOCK", "ST_ModeSelect" },
  ["i"]      = { "INSERT", "ST_ModeInsert" },
  ["ic"]     = { "INSERT", "ST_ModeInsert" },
  ["ix"]     = { "INSERT", "ST_ModeInsert" },
  ["R"]      = { "REPLACE", "ST_ModeReplace" },
  ["Rc"]     = { "REPLACE", "ST_ModeReplace" },
  ["Rx"]     = { "REPLACE", "ST_ModeReplace" },
  ["Rv"]     = { "V-REPLACE", "ST_ModeReplace" },
  ["Rvc"]    = { "V-REPLACE", "ST_ModeReplace" },
  ["Rvx"]    = { "V-REPLACE", "ST_ModeReplace" },
  ["c"]      = { "COMMAND", "ST_ModeCommand" },
  ["cv"]     = { "EX", "ST_ModeCommand" },
  ["ce"]     = { "EX", "ST_ModeCommand" },
  ["r"]      = { "REPLACE", "ST_ModeReplace" },
  ["rm"]     = { "MORE", "ST_ModeCommand" },
  ["r?"]     = { "CONFIRM", "ST_ModeCommand" },
  ["!"]      = { "SHELL", "ST_ModeCommand"},
  ["t"]      = { "TERMINAL", "ST_ModeTerminal" },
}

function M.setup()
  local mode = vim.api.nvim_get_mode().mode
  local current_mode = modes[mode][1]
  return current_mode
end

return M
