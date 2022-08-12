local M = {}
local autocmd = vim.api.nvim_create_autocmd

M.lazy_load = function(config)
  autocmd(config.events, {
    group = vim.api.nvim_create_augroup(config.augroup_name, {}),
    callback = function()
      if config.condition() then
        vim.api.nvim_del_augroup_by_name(config.augroup_name)
        pcall(require, "impatient")

        if config.plugin ~= "nvim-treesitter" then
          vim.defer_fn(function()
            require("packer").loader(config.plugin)
            if config.plugin == "nvim-lspconfig" then
              vim.cmd "silent! do FileType"
            end
          end, 0)
        else
          require("packer").loader(config.plugin)
        end
      end
    end,
  })
end

M.on_file_open = function(plugin)
  M.lazy_load {
    events = { "BufRead", "BufWinEnter", "BufNewFile" },
    augroup_name = "BeLazyOnFileOpen" .. plugin,
    plugin = plugin,
    condition = function()
      local file = vim.fn.expand "%"
      return file ~= "NvimTree_1" and file ~= "[packer]" and file ~= ""
    end,
  }
end

M.gitsigns = function()
  autocmd({ "BufRead" }, {
    callback = function()
      if vim.fn.isdirectory(".git") ~= 0 then
        vim.schedule(function()
          require("packer").loader("gitsigns.nvim")
        end)
      end
    end,
  })
end

return M
