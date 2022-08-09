local M = {}

function M.setup()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  else
    M.branch = vim.b.gitsigns_head
  end

  local fmt = "  " .. M.branch .. " "

  return fmt
end

return M
