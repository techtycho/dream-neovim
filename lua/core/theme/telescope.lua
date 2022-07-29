vim.cmd("highlight! TelescopeNormal guibg=#1A1A1A")
vim.cmd("highlight! TelescopeBorder guibg=#1A1A1A")
vim.cmd("highlight! TelescopeResultsBorder guibg=#1A1A1A")
vim.cmd("highlight! TelescopePreviewBorder guibg=#1A1A1A")

vim.cmd("highlight! TelescopePromptBorder guibg=#333333")
vim.cmd("highlight! TelescopePromptNormal guibg=#333333")

vim.cmd("highlight! TelescopePreviewNormal guibg=#1D1D1D")
vim.cmd("highlight! TelescopePreviewBorder guibg=#1D1D1D")

vim.cmd("highlight! TelescopePreviewTitle guifg=#222222 guibg=#" .. GetColorscheme("String").foreground)
vim.cmd("highlight! TelescopePromptTitle guifg=#222222 guibg=#" .. GetColorscheme("Special").foreground)
vim.cmd("highlight! TelescopeResultsTitle guifg=#222222 guibg=#" .. GetColorscheme("Function").foreground)

vim.cmd("highlight! TelescopeSelection guibg=#333333")
