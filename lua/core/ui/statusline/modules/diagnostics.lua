local M = {}

-- Mostly copied from NvChad
function M.setup()
  if not rawget(vim, "lsp") then
    return ""
  end

  local errors = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
  local warnings = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })
  local hints = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
  local info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO })

  local errors_fmt = (errors and errors > 0) and ("%#ST_Error#  " .. errors .. " ") or ""
  local warnings_fmt = (warnings and warnings > 0) and ("%#ST_Warn#  " .. warnings .. " ") or ""
  local hints_fmt = (hints and hints > 0) and ("%#ST_Hint# ﯧ " .. hints .. " ") or ""
  local info_fmt = (info and info > 0) and ("%#ST_Info#  " .. info .. " ") or ""

  local fmt = errors_fmt .. warnings_fmt .. hints_fmt .. info_fmt .. "%#ST_Normal# "

  return fmt
end

return M
