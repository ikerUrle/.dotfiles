return {
	"nvim-lua/plenary.nvim",

	{ -- HTML autotags
		"windwp/nvim-ts-autotag",
	},

	-- Git related plugins
	"tpope/vim-fugitive",
	"tpope/vim-rhubarb",
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
			})
		end,
	},

	{
		"nvim-lualine/lualine.nvim", -- Fancier statusline
		config = function()
			require("lualine").setup({
				options = {
					icons_enabled = false,
					theme = "material",
					component_separators = "|",
					section_separators = "",
				},
				sections = {
					lualine_c = {
						{
							"filename",
							path = 1,
							symbols = {
								modified = "[+]",
								readonly = "[-]",
								unnamed = "[No Name]",
								newfile = "[New]",
							},
						},
					},
				},
			})
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim", -- Add indentation guides even on blank lines
		config = function()
			require("ibl").setup({})
		end,
	},
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup({})
		end,
	}, -- "gc" to comment visual regions/lines
	"tpope/vim-sleuth", -- Detect tabstop and shiftwidth automatically
	{
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	},

	{
		"nvim-tree/nvim-web-devicons",
		config = function()
			require("nvim-web-devicons").setup({})
		end,
	},

	{
		"folke/trouble.nvim", -- List lsp errors
		dependencies = "nvim-tree/nvim-web-devicons",
		config = function()
			require("trouble").setup({})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local null_ls = require("null-ls")

			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.prettier,
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.diagnostics.eslint_d,
				},
			})
		end,
	},
	"github/copilot.vim",
}
