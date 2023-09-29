-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/iurlezaga/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/home/iurlezaga/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/home/iurlezaga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/home/iurlezaga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/iurlezaga/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["Comment.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  catppuccin = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/catppuccin",
    url = "https://github.com/catppuccin/nvim"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  cmp_luasnip = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["conform.nvim"] = {
    config = { "\27LJ\2\2ë\1\0\0\5\0\14\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\3\0005\4\b\0>\4\1\3=\3\t\0024\3\3\0005\4\n\0>\4\1\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\21formatters_by_ft\1\0\0\bvue\1\3\0\0\14prettierd\rprettier\15javascript\1\3\0\0\14prettierd\rprettier\vpython\1\3\0\0\nisort\nblack\blua\1\0\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/conform.nvim",
    url = "https://github.com/stevearc/conform.nvim"
  },
  ["fidget.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["formatter.nvim"] = {
    config = { "\27LJ\2\2ý\1\0\0\6\0\17\0%6\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0\a\0\4\0X\0\23€6\0\0\0009\0\5\0009\0\6\0009\0\a\0005\1\14\0005\2\n\0006\3\0\0009\3\1\0039\3\b\3)\4\0\0'\5\t\0B\3\3\2=\3\v\0026\3\0\0009\3\1\0039\3\b\3)\4\0\0'\5\f\0B\3\3\2=\3\r\2=\2\15\1B\0\2\1X\0\6€6\0\0\0009\0\5\0009\0\6\0009\0\a\0005\1\16\0B\0\2\1K\0\1\0\1\0\1\nasync\2\nrange\1\0\0\bend\6>\nstart\1\0\0\6<\22nvim_buf_get_mark\vformat\bbuf\blsp\6v\tmode\18nvim_get_mode\bapi\bvim¤\2\1\0\t\0\17\0$6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0019\3\4\0019\4\5\0005\5\15\0005\6\6\0004\a\3\0>\2\1\a=\a\a\0064\a\3\0>\2\1\a=\a\b\0064\a\3\0>\2\1\a=\a\t\0064\a\3\0>\2\1\a=\a\n\0064\a\3\0>\2\1\a=\a\v\0064\a\3\0>\3\1\a=\a\f\0064\a\3\0003\b\r\0>\b\1\a=\a\14\6=\6\16\5B\4\2\1K\0\1\0\rfiletype\1\0\0\6*\0\blua\20typescriptreact\15typescript\20javascriptreact\15javascript\trust\1\0\0\nsetup\vstylua\14prettierd\23formatter.defaults\14formatter\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/formatter.nvim",
    url = "https://github.com/mhartington/formatter.nvim"
  },
  ["gitsigns.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["indent-blankline.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lualine.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["mason-lspconfig.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/mason-lspconfig.nvim",
    url = "https://github.com/williamboman/mason-lspconfig.nvim"
  },
  ["mason.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["nvim-autopairs"] = {
    config = { "\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-cmp"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-lint"] = {
    config = { "\27LJ\2\2\"\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\rtry_lint±\2\1\0\5\0\19\0\0236\0\0\0'\1\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1=\1\2\0006\1\f\0009\1\r\0019\1\14\0015\2\15\0005\3\17\0003\4\16\0=\4\18\3B\1\3\0012\0\0€K\0\1\0\rcallback\1\0\0\0\1\3\0\0\16InsertLeave\17BufWritePost\24nvim_create_autocmd\bapi\bvim\20typescriptreact\1\2\0\0\reslint_d\20javascriptreact\1\2\0\0\reslint_d\15typescript\1\2\0\0\reslint_d\15javascript\1\0\0\1\2\0\0\reslint_d\18linters_by_ft\tlint\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-lint",
    url = "https://github.com/mfussenegger/nvim-lint"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-search-and-replace"] = {
    config = { "\27LJ\2\2I\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\28nvim-search-and-replace\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-search-and-replace",
    url = "https://github.com/s1n7ax/nvim-search-and-replace"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-tree.lua",
    url = "https://github.com/nvim-tree/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-textobjects"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-textobjects",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-textobjects"
  },
  ["nvim-ts-autotag"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    cond = { true },
    loaded = false,
    needs_bufread = false,
    only_cond = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim",
    url = "https://github.com/nvim-telescope/telescope-fzf-native.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["trouble.nvim"] = {
    config = { "\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0" },
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/trouble.nvim",
    url = "https://github.com/folke/trouble.nvim"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/iurlezaga/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: formatter.nvim
time([[Config for formatter.nvim]], true)
try_loadstring("\27LJ\2\2ý\1\0\0\6\0\17\0%6\0\0\0009\0\1\0009\0\2\0B\0\1\0029\0\3\0\a\0\4\0X\0\23€6\0\0\0009\0\5\0009\0\6\0009\0\a\0005\1\14\0005\2\n\0006\3\0\0009\3\1\0039\3\b\3)\4\0\0'\5\t\0B\3\3\2=\3\v\0026\3\0\0009\3\1\0039\3\b\3)\4\0\0'\5\f\0B\3\3\2=\3\r\2=\2\15\1B\0\2\1X\0\6€6\0\0\0009\0\5\0009\0\6\0009\0\a\0005\1\16\0B\0\2\1K\0\1\0\1\0\1\nasync\2\nrange\1\0\0\bend\6>\nstart\1\0\0\6<\22nvim_buf_get_mark\vformat\bbuf\blsp\6v\tmode\18nvim_get_mode\bapi\bvim¤\2\1\0\t\0\17\0$6\0\0\0'\1\1\0B\0\2\0026\1\0\0'\2\2\0B\1\2\0029\2\3\0019\3\4\0019\4\5\0005\5\15\0005\6\6\0004\a\3\0>\2\1\a=\a\a\0064\a\3\0>\2\1\a=\a\b\0064\a\3\0>\2\1\a=\a\t\0064\a\3\0>\2\1\a=\a\n\0064\a\3\0>\2\1\a=\a\v\0064\a\3\0>\3\1\a=\a\f\0064\a\3\0003\b\r\0>\b\1\a=\a\14\6=\6\16\5B\4\2\1K\0\1\0\rfiletype\1\0\0\6*\0\blua\20typescriptreact\15typescript\20javascriptreact\15javascript\trust\1\0\0\nsetup\vstylua\14prettierd\23formatter.defaults\14formatter\frequire\0", "config", "formatter.nvim")
time([[Config for formatter.nvim]], false)
-- Config for: trouble.nvim
time([[Config for trouble.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\ftrouble\frequire\0", "config", "trouble.nvim")
time([[Config for trouble.nvim]], false)
-- Config for: nvim-search-and-replace
time([[Config for nvim-search-and-replace]], true)
try_loadstring("\27LJ\2\2I\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\28nvim-search-and-replace\frequire\0", "config", "nvim-search-and-replace")
time([[Config for nvim-search-and-replace]], false)
-- Config for: nvim-lint
time([[Config for nvim-lint]], true)
try_loadstring("\27LJ\2\2\"\0\0\1\1\1\0\4-\0\0\0009\0\0\0B\0\1\1K\0\1\0\0À\rtry_lint±\2\1\0\5\0\19\0\0236\0\0\0'\1\1\0B\0\2\0025\1\4\0005\2\3\0=\2\5\0015\2\6\0=\2\a\0015\2\b\0=\2\t\0015\2\n\0=\2\v\1=\1\2\0006\1\f\0009\1\r\0019\1\14\0015\2\15\0005\3\17\0003\4\16\0=\4\18\3B\1\3\0012\0\0€K\0\1\0\rcallback\1\0\0\0\1\3\0\0\16InsertLeave\17BufWritePost\24nvim_create_autocmd\bapi\bvim\20typescriptreact\1\2\0\0\reslint_d\20javascriptreact\1\2\0\0\reslint_d\15typescript\1\2\0\0\reslint_d\15javascript\1\0\0\1\2\0\0\reslint_d\18linters_by_ft\tlint\frequire\0", "config", "nvim-lint")
time([[Config for nvim-lint]], false)
-- Config for: Comment.nvim
time([[Config for Comment.nvim]], true)
try_loadstring("\27LJ\2\0029\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\fComment\frequire\0", "config", "Comment.nvim")
time([[Config for Comment.nvim]], false)
-- Config for: conform.nvim
time([[Config for conform.nvim]], true)
try_loadstring("\27LJ\2\2ë\1\0\0\5\0\14\0\0216\0\0\0'\1\1\0B\0\2\0029\0\2\0005\1\f\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0=\3\a\0024\3\3\0005\4\b\0>\4\1\3=\3\t\0024\3\3\0005\4\n\0>\4\1\3=\3\v\2=\2\r\1B\0\2\1K\0\1\0\21formatters_by_ft\1\0\0\bvue\1\3\0\0\14prettierd\rprettier\15javascript\1\3\0\0\14prettierd\rprettier\vpython\1\3\0\0\nisort\nblack\blua\1\0\0\1\2\0\0\vstylua\nsetup\fconform\frequire\0", "config", "conform.nvim")
time([[Config for conform.nvim]], false)
-- Config for: nvim-autopairs
time([[Config for nvim-autopairs]], true)
try_loadstring("\27LJ\2\2@\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\19nvim-autopairs\frequire\0", "config", "nvim-autopairs")
time([[Config for nvim-autopairs]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\2\2C\0\0\2\0\3\0\a6\0\0\0'\1\1\0B\0\2\0029\0\2\0004\1\0\0B\0\2\1K\0\1\0\nsetup\22nvim-web-devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)
-- Conditional loads
time([[Conditional loading of telescope-fzf-native.nvim]], true)
  require("packer.load")({"telescope-fzf-native.nvim"}, {}, _G.packer_plugins)
time([[Conditional loading of telescope-fzf-native.nvim]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd nvim-treesitter ]]
vim.cmd [[ packadd nvim-treesitter-textobjects ]]
time([[Sequenced loading]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
