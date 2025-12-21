return {
	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
			"j-hui/fidget.nvim",
		},
		config = function()
			local servers = { "clangd", "rust_analyzer", "pyright", "lua_ls", "gopls", "ts_ls" }

			vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format)
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)

			require("mason").setup()
			-- Ensure the servers above are installed
			require("mason-lspconfig").setup({
				ensure_installed = servers,
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"nvimtools/none-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		config = function()
			require("mason-null-ls").setup({
				-- ensure_installed = { "eslint", "jq" }
				ensure_installed = { "jq" },
			})
		end,
	},

	{ -- Autocompletion
		"hrsh7th/nvim-cmp",
		dependencies = { "hrsh7th/cmp-nvim-lsp" },
		config = function()
			-- Turn on status information
			require("fidget").setup()

			-- nvim-cmp setup
			local cmp = require("cmp")

			cmp.setup({
				mapping = cmp.mapping.preset.insert({
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-Space>"] = cmp.mapping.complete(),
					["<CR>"] = cmp.mapping.confirm({ select = true }),
					["<Tab>"] = function(fallback)
						if not cmp.select_next_item() then
							if vim.bo.buftype ~= 'prompt' and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
					["<S-Tab>"] = function(fallback)
						if not cmp.select_prev_item() then
							if vim.bo.buftype ~= 'prompt' and has_words_before() then
								cmp.complete()
							else
								fallback()
							end
						end
					end,
				}),
				sources = {
					{ name = "nvim_lsp" },
				},
			})
		end,
	},
}
