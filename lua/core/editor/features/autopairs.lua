-- Setup nvim-autopairs module and handle possible exceptions
local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
  vim.notify("Cannot find nvim-autopairs")
  return
end

-- Autopairs setup
npairs.setup {
  -- Treesitter stuff
  check_ts = true,
  ts_config = {
    lua = { "string", "source" },
    javascript = { "string", "template_string" },
    java = false,
  },
  disable_filetype = { "TelescopePrompt", "spectre_panel" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" }, -- Character that can be paired
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0, -- Offset from pattern match
    -- Behavior in Alt-E
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    -- Highlight groups
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

-- Completion Autpairs
local cmp_autopairs = require "nvim-autopairs.completion.cmp"
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("Cannot find nvim-cmp")
  return
end
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done { map_char = { tex = "" } }) -- Include () in completion
