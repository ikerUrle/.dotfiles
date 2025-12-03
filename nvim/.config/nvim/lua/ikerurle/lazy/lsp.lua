return {
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    dependencies = {
      'williamboman/mason.nvim',
      'williamboman/mason-lspconfig.nvim',
      'neovim/nvim-lspconfig',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/nvim-cmp',
      'L3MON4D3/LuaSnip',
      'j-hui/fidget.nvim',
    },
  },
  {
    "jay-babu/mason-null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "nvimtools/none-ls.nvim",
      "nvimtools/none-ls-extras.nvim"
    },
  },

  { -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = { 'hrsh7th/cmp-nvim-lsp', 'L3MON4D3/LuaSnip', 'saadparwaiz1/cmp_luasnip' ,
    },
    config = function()
      local lsp_zero = require('lsp-zero')

      local servers = { 'clangd', 'rust_analyzer', 'pyright', 'lua_ls', 'gopls','ts_ls' }

      local on_attach = function(_, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end

      lsp_zero.on_attach(on_attach)

      vim.keymap.set('n', '<leader>fa', vim.lsp.buf.format)
      vim.keymap.set('n', '<leader>.', vim.lsp.buf.code_action)
      vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename)

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })
      end)

      require('mason').setup()
      -- Ensure the servers above are installed
      require('mason-lspconfig').setup {
        ensure_installed = servers,
        handlers = {
          lsp_zero.default_setup,
        }
      }

      require("mason-null-ls").setup({
        -- ensure_installed = { "eslint", "jq" }
        ensure_installed = { "jq" }
      })

      -- Turn on status information
      require('fidget').setup()


      -- nvim-cmp setup
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      local cmp_action = require('lsp-zero').cmp_action()

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        }, mapping = cmp.mapping.preset.insert {
        ['<C-k>'] = cmp.mapping.select_prev_item(),
        ['<C-j>'] = cmp.mapping.select_next_item(),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
        ['<Tab>'] = cmp_action.tab_complete(),
        ['<S-Tab>'] = cmp_action.select_prev_or_fallback(),
      },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
      }
    end

  },
}
