local M = {}

-- Utility Functions --
-- Gets highlight group data and throws execeptions when not found
function GetColorscheme(hl_name)
  local hl = vim.api.nvim_get_hl_by_name(hl_name, true) -- Get highlight group data
  -- Return nil if highlight group doesn't exist
  if not hl.foreground and not hl.background then
    return nil
  end
  -- If the highlight group doesn't have a background color, return a table with the first value set to nil
  if not hl.background then
    return {
      background = nil, -- No background color
      foreground = hl.foreground and string.format("%06x", hl.foreground), -- Return foreground color as usual
    }
  end

  -- Return data converted to hexadecimal
  return {
    background = hl.background and string.format("%06x", hl.background),
    foreground = hl.foreground and string.format("%06x", hl.foreground),
  }
end

-- Export function
M.GetColorscheme = GetColorscheme

return M
