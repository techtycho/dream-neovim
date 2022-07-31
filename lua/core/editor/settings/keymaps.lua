-- Mapping Options
local noremap   = { noremap = true,  silent = true }
local remap     = { noremap = false, silent = true }
local term_opts = { silent  = true }
-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", noremap)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", noremap)
keymap("n", "<C-j>", "<C-w>j", noremap)
keymap("n", "<C-k>", "<C-w>k", noremap)
keymap("n", "<C-l>", "<C-w>l", noremap)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize +2<CR>", noremap)
keymap("n", "<C-Down>", ":resize -2<CR>", noremap)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", noremap)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", noremap)

keymap("n", "<leader>e", ":Lex 30<cr>", noremap) -- Open Lexplore

-- Clear Highlighting
keymap("n", "<ESC><esc>", ":noh<cr>", noremap)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", noremap)
keymap("n", "<tab>", ":bnext<CR>", noremap) -- Preferred Keybinding
keymap("n", "<S-h>", ":bprevious<CR>", noremap)

-- Visual --
-- Stay in indent mode when changing the level of indent
keymap("v", "<", "<gv", noremap)
keymap("v", ">", ">gv", noremap)

-- Move text up and down, like VSCode
keymap("v", "<A-j>", ":m .+1<CR>==", noremap)
keymap("v", "<A-k>", ":m .-2<CR>==", noremap)

-- Replace line with text in clipboard
keymap("v", "p", '"_dP', noremap)

-- Visual Block --
-- Move text up and down
-- With Shift
keymap("x", "J", ":move '>+1<CR>gv-gv", noremap)
keymap("x", "K", ":move '<-2<CR>gv-gv", noremap)
-- With Alt
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", noremap)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", noremap)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", term_opts)

-- Telescope
-- Find Files
keymap("n", "<leader>f", "<cmd>lua << EOF\
  require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false,\
  borderchars = {' ',' ',' ',' ',' ',' ',' ',' '},\
  path_display = {'tail'},\
  color_devicons = true}))\
EOF<cr>", noremap)
keymap("n", "<leader>tf", "<cmd>Telescope find_files<cr>", noremap)
-- Live Grep
keymap("n", "<c-t>", "<cmd>Telescope live_grep<cr>", noremap)

-- Comment
keymap("n", "<leader>/", "gcc", remap) -- Current Line
keymap("v", "<leader>/", "gc", remap) -- Selection

-- Git
-- Show blame for current line
keymap("n", "<leader>g", ":Gitsigns blame_line<CR>", noremap)
