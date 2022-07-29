local configs = require("nvim-treesitter.configs")
-- Setup Treesitter
configs.setup {
  ensure_installed = "all",
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- False will disable the whole extension
    disable = { "" }, -- List of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = true, disable = { "yaml" } }, -- Indent depending on context except for YAML
  -- Autopairs
  autopairs = {
    enable = true,
  },
  -- Comment
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
  -- Rainbow bracket pairs
  rainbow = {
    enable = false, -- Disabled by default
    extended_mode = true,
    max_file_lines = nil,
  },
  -- Playground for inspecting treesitter sytax highlighting
  --! The plugin isn't installed by default, since it is not needed!
  playground = {
    enable = false,
  },
}
