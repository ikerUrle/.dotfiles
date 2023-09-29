-- Install packer
local install_path = vim.fn.stdpath 'data' .. '/site/pack/packer/start/packer.nvim'
local is_bootstrap = false
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  is_bootstrap = true
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
  vim.cmd [[packadd packer.nvim]]
end

require('packer').startup(function(use)
  -- Package manager
  use 'wbthomason/packer.nvim'


  use { -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    requires = {
      -- Automatically install LSPs to stdpath for neovim
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      'j-hui/fidget.nvim',
    },
  }

  use { -- Autocompletion
    'hrsh7th/nvim-cmp',
    requires = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' },
  }

  use { -- Highlight, edit, and navigate code
    'nvim-treesitter/nvim-treesitter',
    run = function()
      pcall(require('nvim-treesitter.install').update { with_sync = true })
    end,
  }

  use {
    "mfussenegger/nvim-lint",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = {
        javascript = {
          "eslint_d"
        },
        typescript = {
          "eslint_d"
        },
        javascriptreact = {
          "eslint_d"
        },
        typescriptreact = {
          "eslint_d"
        }
      }

      -- Autocommand for nvim-lint
      vim.api.nvim_create_autocmd({ "InsertLeave", "BufWritePost" }, {
        callback = function()
          lint.try_lint()
        end,
      })
    end

  }
  use {
    'stevearc/conform.nvim',
    config = function() require('conform').setup() end
  }

  use {
    "mhartington/formatter.nvim",
    config = function()
      local formatter = require("formatter")
      local default_formatters = require("formatter.defaults")
      local prettierd = default_formatters.prettierd
      local stylua = default_formatters.stylua
      formatter.setup({
        filetype = {
          rust = {
            prettierd
          },
          javascript = {
            prettierd
          },
          javascriptreact = {
            prettierd
          },
          typescript = {
            prettierd
          },
          typescriptreact = {
            prettierd
          },
          lua = {
            stylua
          },
          ["*"] = {
            -- other functions before it
            function()
              if vim.api.nvim_get_mode().mode == "v" then
                vim.lsp.buf.format({
                  range = {
                    ["start"] = vim.api.nvim_buf_get_mark(0, "<"),
                    ["end"] = vim.api.nvim_buf_get_mark(0, ">"),
                  }
                })
              else
                vim.lsp.buf.format({ async = true })
              end
            end,
          }
        }
      })
    end
  }


  use { -- Additional text objects via treesitter
    'nvim-treesitter/nvim-treesitter-textobjects',
    after = 'nvim-treesitter',
  }
  use { -- HTML autotags
    'windwp/nvim-ts-autotag',
  }

  -- Git related plugins
  use 'tpope/vim-fugitive'
  use 'tpope/vim-rhubarb'
  use 'lewis6991/gitsigns.nvim'

  -- use 'navarasu/onedark.nvim' -- Theme inspired by Atom
  use { "catppuccin/nvim", as = "catppuccin" }
  use { "folke/tokyonight.nvim" }

  use 'nvim-lualine/lualine.nvim'           -- Fancier statusline
  use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
  use { 'numToStr/Comment.nvim',
    config = function() require("Comment").setup {} end
  }                      -- "gc" to comment visual regions/lines
  use 'tpope/vim-sleuth' -- Detect tabstop and shiftwidth automatically

  use {
    "windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  -- Fuzzy Finder (files, lsp, etc)
  use { 'nvim-telescope/telescope.nvim', branch = '0.1.x', requires = { 'nvim-lua/plenary.nvim' } }

  -- Fuzzy Finder Algorithm which requires local dependencies to be built. Only load if `make` is available
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make', cond = vim.fn.executable 'make' == 1 }

  use { 'nvim-tree/nvim-web-devicons',
    config = function() require("nvim-web-devicons").setup {} end
  }

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    }
  }

  -- List lsp errors
  use {
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      }
    end
  }

  use {
    's1n7ax/nvim-search-and-replace',
    config = function()
      require 'nvim-search-and-replace'.setup {}
    end
  }
  -- use {
  --   "neomake/neomake",
  --   config = function()
  --     require("neomake").setup {
  --       -- your configuration comes here
  --       -- or leave it empty to use the default settings
  --       -- refer to the configuration section below
  --     }
  --   end
  -- }

  -- Add custom plugins to packer from /nvim/lua/custom/plugins.lua
  local has_plugins, plugins = pcall(require, "custom.plugins")
  if has_plugins then plugins(use) end

  if is_bootstrap then
    require('packer').sync()
  end
end)

-- When we are bootstrapping a configuration, it doesn't
-- make sense to execute the rest of the init.lua.
--
-- You'll need to restart nvim, and then it will work.
if is_bootstrap then
  print '=================================='
  print '    Plugins are being installed'
  print '    Wait until Packer completes,'
  print '       then restart nvim'
  print '=================================='
  return
end

-- Automatically source and re-compile packer whenever you save this init.lua
local packer_group = vim.api.nvim_create_augroup('Packer', { clear = true })
vim.api.nvim_create_autocmd('BufWritePost', {
  command = 'source <afile> | PackerCompile',
  group = packer_group,
  pattern = vim.fn.expand '$MYVIMRC',
})
