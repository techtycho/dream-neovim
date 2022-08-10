local M = {}

local status_ok, devicons = pcall(require, "nvim-web-devicons")
if not status_ok then
  return
end

M.special = {
  ["NvimTree_1"] = { "פּ", "Explorer" },
}

devicons.set_icon {
  js = {
    icon = "",
    color = "#D6BB32",
    name = "js",
  },
}

return M
