function _G.open_term()
  vim.cmd "botright new +term"
  vim.wo.number = false
  vim.cmd "startinsert!"
  vim.cmd "tnoremap <Esc><Esc> <C-\\><C-n>:q!<CR>"
end

vim.cmd "nnoremap <leader>tre :lua _G.open_term()<CR>"
