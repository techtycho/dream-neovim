local M = {}

function M.setup()
  if not vim.b.gitsigns_head or vim.b.gitsigns_git_status then
    return ""
  else
    M.branch = vim.b.gitsigns_head
  end

  local git_status = vim.b.gitsigns_status_dict

  local added = (git_status.added and git_status.added ~= 0) and (" %#DiffAdd# +" .. git_status.added) or ""
  local changed = (git_status.changed and git_status.changed ~= 0) and (" %#DiffChange# ~" .. git_status.changed) or ""
  local removed = (git_status.removed and git_status.removed ~= 0) and (" %#DiffDelete# -" .. git_status.removed) or ""

  local fmt = "  " .. M.branch .. added .. changed .. removed .. " %#ST_Normal#"

  return fmt
end

return M
