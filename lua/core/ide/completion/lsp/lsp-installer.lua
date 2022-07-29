local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
  vim.notify("Cannot setup nvim-lsp-installer")
	return
end

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific server instances instead (see example below).
lsp_installer.on_server_ready(function(server)
	local opts = {
		on_attach = require("core.ide.completion.lsp.handlers").on_attach,
		capabilities = require("core.ide.completion.lsp.handlers").capabilities,
	}

  -- Special server settings
  if server.name == "sumneko_lua" then
    -- Import the settings
    local sumneko_opts = require("core.ide.completion.lsp.settings.sumneko_lua")
    opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
  end

	-- This setup() function is exactly the same as lspconfig's setup function.
	-- Refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
	server:setup(opts)
end)
