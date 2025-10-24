return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.x',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')

      vim.keymap.set('n', '<leader>p', builtin.find_files, { desc = 'Find files' })
      -- vim.keymap.set('n', '<leader>h', builtin.help_tags, { desc = 'Search [H]elp' })
      vim.keymap.set('n', '<leader>fw', builtin.grep_string, { desc = '[F]ind current [W]ord' })
      vim.keymap.set('n', '<leader>ff',function()
        builtin.live_grep({ additional_args = { '--fixed-strings' }}) end,
      { desc = '[F]uzzy [F]ind' })
      vim.keymap.set('n', '<leader>fd', builtin.diagnostics, { desc = '[F]ind [D]iagnostics' })
      vim.keymap.set('n', '<leader>l', builtin.resume, { desc = 'Repeat [L]ast action' })
      -- vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, { desc = '[F]ind [S]ymbols' })

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      local telescope_actions = require('telescope.actions')
      require('telescope').setup {
        pickers = {
          lsp_document_symbols = {
            symbols = { 'Function', 'Method', 'Field', 'Constructor' },
          },
        },
        defaults = {
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<C-d>'] = false,
              ['<C-j>'] = telescope_actions.move_selection_next,
              ['<C-k>'] = telescope_actions.move_selection_previous,
            },
          },
        },
      }

-- See `:help telescope.builtin`
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader>ob', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
vim.keymap.set('n', '<leader>/', function()
  -- You can pass additional configuration to telescope to change theme, layout, etc.
  require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
    winblend = 10,
    previewer = false,
    disable_devicons = true,
  })
end, { desc = '[/] Fuzzily search in current buffer]' })
    end
  },

}
