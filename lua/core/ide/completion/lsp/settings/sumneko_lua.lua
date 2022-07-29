-- Settings for sumneko_lua LSP language server
return {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Mark vim as a default global, so it does not complain about vim not being declared
      },
      workspace = {
        library = {
          [vim.fn.expand("$VIMRUNTIME/lua")] = true,
          [vim.fn.stdpath("config") .. "/lua"] = true,
        },
      },
    },
  },
}
