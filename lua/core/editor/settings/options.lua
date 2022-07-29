-- Options for Neovim
local options = {
  backup = false,
  clipboard = "unnamedplus",                      -- Clipboard
  cmdheight = 1,                                  -- Command section height, higher value for a higher statusline
  completeopt = { "menuone", "noselect" },
  conceallevel = 0,
  fileencoding = "utf-8",                         -- Encoding
  hlsearch = true,
  ignorecase = true,                              -- Ignore case when searching
  mouse = "a",                                    -- Support external clipboard
  pumheight = 10,
  showmode = false,                               -- Disable the oldschool "-- INSERT --"
  showtabline = 2,                                -- Show tab line
  smartcase = true,
  smartindent = true,                             -- Automatically detect what indent level the cursor will go in a new line, based on context
  splitbelow = true,
  splitright = true,
  swapfile = false,
  termguicolors = true,                           -- Very Important
  timeoutlen = 1000,
  undofile = true,
  updatetime = 300,
  writebackup = false,
  expandtab = true,                               -- Spaces instead of Tabs
  shiftwidth = 2,
  tabstop = 2,                                    -- Tab size, I like 2 spaces per tab
  cursorline = true,
  number = true,                                  -- Show line number
  relativenumber = false,                         -- Enable if you want, won't break anything
  numberwidth = 1,                                -- Distance from screen edge to line number column
  signcolumn = "yes",
  wrap = false,                                   -- Wrapping, set to false
  scrolloff = 8,
  sidescrolloff = 8,
  guifont = "monospace:h17",                      -- Font for GUI clients like Neovide, won't matter in terminal clients, this configuraton wasn't designed for GUI neovim clients
  laststatus = 3,                                 -- Global statusline, no matter how many window (split) is open, enable for a nice, modern and crisp user interface
}

vim.opt.shortmess:append "c"

-- Loop through the options and set them
for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]] -- Hard to describe, this makes foo-bar a single word, so you can just do `de` to delete the entire word
vim.cmd [[set formatoptions-=cro]]
