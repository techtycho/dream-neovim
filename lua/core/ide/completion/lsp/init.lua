local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify("Cannot setup lspconfig")
	return
end

require("core.ide.completion.lsp.handlers").setup() -- Handler for diagnostics
