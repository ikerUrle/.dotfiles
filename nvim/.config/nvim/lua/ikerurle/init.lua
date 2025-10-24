--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

require("ikerurle.set")
require("ikerurle.mappings")
require("ikerurle.neomake")
require("ikerurle.lazy_init")
