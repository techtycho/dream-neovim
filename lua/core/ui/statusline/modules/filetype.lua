local M = {}

function M.setup()
  local filename = vim.fn.expand("%:t")

  if filename ~= "NvimTree_1" and filename ~= "" then
    local fmt = "  %y "
    return fmt
  end

  return ""
end

return M
