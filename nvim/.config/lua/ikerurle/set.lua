
-- See `:help vim.o`
-- Make line numbers default
vim.wo.number = true
vim.opt.relativenumber = true

-- Set highlight on search
vim.o.hlsearch = false


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
vim.g.colorscheme = "catppuccin"

vim.cmd("colorscheme " .. vim.g.colorscheme)

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- [[ Basic Keymaps ]]
-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
