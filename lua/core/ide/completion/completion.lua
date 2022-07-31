-- Import cmp module and throw exceptions
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  vim.notify("Cannot import completion module")
  return
end

-- Import cmp module and throw exceptions
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  vim.notify("Cannot import luasnip module")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Function to check backspace
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

-- Icons to be used in completion
-- Icon color is determined in lua/core/theme/completion.lua
local kind_icons = {
  Namespace = "ﰠ",
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
  Object = " ",
  Tag = "",
  Calendar = "",
  Watch = " ",
  Package = "",
} -- source: https://www.nerdfonts.com/cheat-sheet

-- Configuration
cmp.setup {
  -- Disable completion in comments and strings
  enabled = function()
    local context = require 'cmp.config.context'
    -- Keep command mode completion enabled when cursor is in a comment
    if vim.api.nvim_get_mode().mode == 'c' then
      return true
    else
      return not context.in_treesitter_capture("string")
        and not context.in_syntax_group("String") and not context.in_treesitter_capture("comment")
        and not context.in_syntax_group("Comment")
    end
  end,
  view = {
    entries = "custom", -- Custom completion window
  },
  -- Snippet configuration
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  formatting = {
    -- Specify the order of completion item fields
    -- Abbreviation name, note that "menu" is just a space, then the kind
    fields = { "abbr", "menu", "kind" },
    format = function(entry, vim_item)
      -- Kind is composed of kind icon and kind name
      -- Icon color is determined in lua/core/theme/completion.lua
      vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- "\t\t\t" is for spacing, "menu" serves no purpose
      vim_item.menu = ({
        nvim_lsp = "\t\t\t",
        nvim_lua = "\t\t\t",
        luasnip = "\t\t\t",
        buffer = "\t\t\t",
        path = "\t\t\t",
      })[entry.source.name]
      return vim_item
    end,
  },
  -- Completion sources, order is important
  sources = {
    { name = "nvim_lsp" }, -- LSP
    { name = "nvim_lua" }, -- Lua Completion
    { name = "luasnip" }, -- Snippets
    { name = "buffer" }, -- Text, words that are used previously in the current buffer
    { name = "path" }, -- Path, like VSCode's Path Intellisense extension
  },
  -- Replaces text when confirming
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  -- Window appearance
  window = {
    --! This is an extended template of |nvim_open_win|, read it for documentation on window appearance and better understanding!
    -- Completion window
    completion = cmp.config.window.bordered({
      border = "single", -- "rounded" for a rounded window, see |nvim_open_win| for more border options
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None", -- Win highlight, see |nvim_open_win|
    }),
    -- Documentation window
    documentation = cmp.config.window.bordered({
      -- Same options as in the completion window
      border = "single",
      winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    }),
  },
  experimental = {
    ghost_text = false, -- Ghost text, grayed out text for completion suggestions
    native_menu = false,
  },
  -- Keybindings
  mapping = {
    ["<C-k>"] = cmp.mapping.select_prev_item(), -- Select previous item
		["<C-j>"] = cmp.mapping.select_next_item(), -- Select next item
    ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }), -- Scroll upwards in the documentation window
    ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }), -- Scroll downwards in the documentation window
    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }), -- Confirm suggestion
    ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ["<C-e>"] = cmp.mapping.abort(), -- Close the completion window
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = true },
    -- Super Tab
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expandable() then
        luasnip.expand()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif check_backspace() then
        fallback()
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
    -- Like super tab but the opposite, scrolls upwards
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
}
