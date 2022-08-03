local M = {}

-- Import GetColorscheme() so it can be used
local GetColorscheme = require("core.theme.util").GetColorscheme

-- Specifies how a line with diagnostics looks like depending on the severity and colorscheme
local function getLineDiagnostic(severity)
  local status_ok = GetColorscheme("DiagnosticVirtualTextError").background -- Check if the highlight group has a background color
  -- Highlights the line if the colorscheme supports that
  if status_ok then
    vim.cmd("highlight! LineDiagnostic" .. severity .. " guibg=#" .. GetColorscheme("DiagnosticVirtualText" .. severity).background) -- Set the highlight group
  else
    -- If the colorscheme doesn't support that, highlight the line with a light color
    return "LineDiagnostic"
  end

  -- Returns the name of the highlight group after setting it
  return "LineDiagnostic" .. severity
end

-- Setup Configuration
M.setup = function()
  -- Sign appearance settings
  local signs = {
    -- This is also a good icon 
    { name = "DiagnosticSignError", text = "~", line = "LineDiagnostic", severity = "Error" },
    { name = "DiagnosticSignWarn",  text = "~", line = "LineDiagnostic", severity = "Warn" },
    { name = "DiagnosticSignHint",  text = "~", line = "LineDiagnostic", severity = "Hint" },
    { name = "DiagnosticSignInfo",  text = "~", line = "LineDiagnostic", severity = "Info" },
  }

  -- Define the signs based on the sign appearance settings
  for _, sign in ipairs(signs) do
    -- This sets the sign icon and highlights the line
    vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "", linehl = getLineDiagnostic(sign.severity) })
  end

  -- Diagnostic configuration
  local config = {
    virtual_text = {
      true, -- Enabled by default
      prefix = "",
    },
    signs = {
      active = signs,
    },
    update_in_insert = true,
    -- Underline is disabled for all severties except for hints
    underline = {
      false,
      severity = vim.diagnostic.severity.HINT, -- Only in hints
    },
    severity_sort = true, -- Enable
    -- Appearance of the floating window
    float = {
      focusable = false,
      style = "minimal",
      border = "single", -- Sharp border, see |nvim_open_win| for more options
      source = "always",
      header = "", -- Leave empty, this adds a header to the window
      prefix = " ", -- Leave some space for the window to look good
    },
  }

  vim.diagnostic.config(config)

  -- Some other settings
  vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
    border = "single",
  })

  vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
    border = "single",
  })
end

local function lsp_highlight_document(client)
  -- Set autocommands conditional on server_capabilities
  if client.resolved_capabilities.document_highlight then
    vim.api.nvim_exec(
      [[
      augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
      augroup END
    ]],
      false
    )
  end
end

local function lsp_keymaps(bufnr)
  local opts = { noremap = true, silent = true }
  -- Useful functions for better editing, I've highlighted some of the cool ones
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts) -- See the definition of the symbol

  vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts) -- See info about the current symbol
  vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Rename symbol

  vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "[d", '<cmd>lua vim.diagnostic.goto_prev({ border = "single" })<CR>', opts)

  -- Open the floating window for diagnosing errors
  vim.api.nvim_buf_set_keymap(
    bufnr,
    "n",
    "gl",
    '<cmd>lua vim.diagnostic.open_float({ border = "single" })<CR>',
    opts
  )
  vim.api.nvim_buf_set_keymap(bufnr, "n", "]d", '<cmd>lua vim.diagnostic.goto_next({ border = "single" })<CR>', opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>q", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
  vim.cmd [[ command! Format execute 'lua vim.lsp.buf.formatting()' ]]
end

M.on_attach = function(client, bufnr)
  if client.name == "tsserver" then
    client.resolved_capabilities.document_formatting = false
  end
  lsp_keymaps(bufnr)
  lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
  return
end

M.capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

return M
