-- See `:help vim.o`
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
-- Make line numbers default
vim.o.number = true
vim.opt.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false

vim.o.tabstop = 2
vim.o.expandtab = true


-- Enable mouse mode
vim.o.mouse = 'a'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case insensitive searching UNLESS /C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'
vim.o.scrolloff = 10

-- Set colorscheme
vim.o.termguicolors = true

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'
