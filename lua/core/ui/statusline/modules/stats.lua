local M = {}

function M.setup()

  local current_line = vim.fn.line(".")
  local total_line = vim.fn.line("$")
  local text = math.modf((current_line / total_line) * 100) .. tostring("%%")

  text = (current_line == 1 and "Top") or text
  text = (current_line == total_line and "Bot") or text

  local fmt = "  " .. text .. " %l  "

  return fmt
end

return M
