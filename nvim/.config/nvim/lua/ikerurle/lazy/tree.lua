return {
  {
    'nvim-tree/nvim-tree.lua',
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          width = {} -- dynamic width
        },
        actions = {
          open_file = {
            quit_on_open = true,
          },
        },
        filters = {
          dotfiles = false
        }
      }
      vim.keymap.set('n', '<leader>tt', '<cmd>NvimTreeToggle<cr>')
      vim.keymap.set('n', '<leader>te', '<cmd>NvimTreeFindFile<cr>')
    end
  },
}
