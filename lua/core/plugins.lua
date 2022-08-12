  --! Packer is used as a plugin manager!
  local fn = vim.fn

  -- Stuff that you don't need to care about, installation path
  local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    PACKER_BOOTSTRAP = fn.system {
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path,
    }
    print "Installing packer close and reopen Neovim..."
    vim.cmd [[packadd packer.nvim]]
  end

  -- Autocommand that reloads neovim whenever you save the plugins.lua file
  -- :w automatically runs :PackerSync
  vim.cmd [[
    augroup packer_user_config
      autocmd!
      autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]

  -- Use a protected call so we don't error out on first use
  local status_ok, packer = pcall(require, "packer")
  if not status_ok then
    return
  end

  -- Have packer use a popup window, not important
  packer.init {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "single" } -- For a list of border styles other than single, see |nvim_open_win|
      end,
    },
  }

  -- Install your plugins here
  return packer.startup(function(use)
    use "wbthomason/packer.nvim" -- Have packer manage itself

    -- Plugins as dependencies
    use { "nvim-lua/plenary.nvim", module = "plenary" } -- Useful lua functions used by lots of plugins

    -- Editor Features
    use { "windwp/nvim-autopairs", after = "nvim-cmp", config = function ()
      require "core.editor.features.autopairs"
    end }
    -- Comments
    use { "numToStr/Comment.nvim", after = "nvim-treesitter" }
    use { "JoosepAlviste/nvim-ts-context-commentstring", after = "Comment.nvim", config = function ()
      require("core.editor.features.comments")
    end }

    -- Colorschemes
    use "projekt0n/github-nvim-theme"  -- GitHub Theme

    -- Completion plugins
    use { "hrsh7th/nvim-cmp",
      module = { "cmp", "cmp_nvim_lsp" },
      event = "InsertEnter",
    }
    use { "hrsh7th/cmp-buffer", after = "cmp-nvim-lsp" } -- Buffer completions
    use { "hrsh7th/cmp-path", after = "cmp-buffer" } -- Path completions
    use { "saadparwaiz1/cmp_luasnip", after = "LuaSnip" } -- Snippet completions
    use { "hrsh7th/cmp-nvim-lsp", after = "cmp-nvim-lua" } -- Completion for LSP
    use { "hrsh7th/cmp-nvim-lua", after = "cmp_luasnip" } -- Lua completion

    -- Snippets
    use { "L3MON4D3/LuaSnip", after = "nvim-cmp",
      config = function ()
        require("core.ide.completion.completion")
      end,
    } -- Snippet engine

    -- LSP
    use { "neovim/nvim-lspconfig",
      opt = true,
      setup = function ()
        require("core.lazyload").on_file_open("nvim-lspconfig")
      end,
      config = function ()
        require("core.ide.completion.lsp")
      end,
    }
    use { "williamboman/nvim-lsp-installer", after = "nvim-lspconfig", config = function ()
      require("core.ide.completion.lsp.lsp-installer")
    end }
    -- Telescope
    use { "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope.builtin",
      config = function ()
        require "core.extra.telescope"
      end
    }
    -- Treesitter, powerful syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      module = "nvim-treesitter",
      setup = function ()
        require("core.lazyload").on_file_open("nvim-treesitter")
      end,
      cmd = {
        "TSInstall",
        "TSBufEnable",
        "TSBufDisable",
        "TSEnable",
        "TSDisable",
        "TSModuleInfo",
      },
      run = ":TSUpdate",
      config = function ()
        require("core.ide.treesitter")
      end
    }
    -- Git
    use {
      "lewis6991/gitsigns.nvim",
      setup = function ()
        require("core.lazyload").gitsigns()
      end,
      config = function ()
        require("core.ide.git")
      end
    } -- GitSigns, like GitLens in VSCode, some features are disabled by default
    -- Extra
    use { "lukas-reineke/indent-blankline.nvim", opt = true, setup = function ()
      require("core.lazyload").on_file_open("indent-blankline.nvim")
    end } -- Indent lines for readablity
    use "kyazdani42/nvim-web-devicons"
    use { "akinsho/bufferline.nvim", tag = "v2.*" }
    use { "moll/vim-bbye", cmd = "Bdelete" }
    use { "kyazdani42/nvim-tree.lua",
      cmd = { "NvimTreeToggle", "NvimTreeFocus" },
      config = function ()
        require("core.ui.nvimtree")
      end,
    }
    use { "lewis6991/impatient.nvim", module = "impatient" }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end)
