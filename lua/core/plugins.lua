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
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used by lots of plugins

    -- Editor Features
    use "windwp/nvim-autopairs"
    -- Comments
    --use "numToStr/Comment.nvim"
    --use "JoosepAlviste/nvim-ts-context-commentstring"

    -- Colorschemes
    use "navarasu/onedark.nvim" -- Onedark
    use "olimorris/onedarkpro.nvim" -- OneDarkPro
    use "projekt0n/github-nvim-theme" -- GitHub Theme
    use "catppuccin/nvim" -- Catppuccin
    use "LunarVim/darkplus.nvim" -- VSCode Dark+ (Default)

    -- Completion plugins
    use "hrsh7th/nvim-cmp"
    use "hrsh7th/cmp-buffer" -- Buffer completions
    use "hrsh7th/cmp-path" -- Path completions
    use "hrsh7th/cmp-cmdline" -- Cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- Snippet completions
    use "hrsh7th/cmp-nvim-lsp" -- Completion for LSP
    use "hrsh7th/cmp-nvim-lua" -- Lua completion

    -- Snippets
    use "L3MON4D3/LuaSnip" -- Snippet engine

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    -- Telescope
    use { "nvim-telescope/telescope.nvim",
      cmd = "Telescope",
      module = "telescope.builtin",
      config = function ()
      require "core.extra.telescope"
    end }
    -- Treesitter, powerful syntax highlighting
    use {
      "nvim-treesitter/nvim-treesitter",
      run = ":TSUpdate",
      event = "BufEnter",
      config = function ()
        require("core.ide.treesitter")
        require("core.ide.completion")
      end
    }
    -- Git
    use "lewis6991/gitsigns.nvim" -- GitSigns, like GitLens in VSCode, some features are disabled by default
    -- Extra
    use { "lukas-reineke/indent-blankline.nvim", event = "BufEnter" } -- Indent lines for readablity
    use "kyazdani42/nvim-web-devicons"
    use { "akinsho/bufferline.nvim", tag = "v2.*" }
    use { "moll/vim-bbye", cmd = "Bdelete" }
    use { "kyazdani42/nvim-tree.lua",
      cmd = "NvimTreeToggle",
      config = function ()
        require("core.ui.nvimtree")
      end,
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end)
