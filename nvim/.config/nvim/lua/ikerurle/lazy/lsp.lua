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

			-- Configuración de diagnósticos inline
			vim.diagnostic.config({
				virtual_text = true,  -- Habilita los mensajes inline
				signs = true,
				underline = true,
				update_in_insert = false,  -- No actualiza mientras escribes
				severity_sort = true,  -- Errores tienen prioridad sobre warnings
			})

			vim.keymap.set("n", "<leader>fa", vim.lsp.buf.format)
			vim.keymap.set("n", "<leader>.", vim.lsp.buf.code_action)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename)
			vim.keymap.set("n", "gd", vim.lsp.buf.definition)

			-- Configuración específica para lua_ls usando vim.lsp.config
			vim.lsp.config.lua_ls = {
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
					},
				},
			}

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
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",  -- Solo cargar cuando abras archivos .java
	},
	{
		"NickvanDyke/opencode.nvim",
		dependencies = {
			-- Recommended for `ask()` and `select()`.
			-- Required for `snacks` provider.
			---@module 'snacks' <- Loads `snacks.nvim` types for configuration intellisense.
			{ "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
		},
		config = function()
			---@type opencode.Opts
			vim.g.opencode_opts = {
				-- Your configuration, if any — see `lua/opencode/config.lua`, or "goto definition" on the type or field.
			}

			-- Required for `opts.events.reload`.
			vim.o.autoread = true

			-- Recommended/example keymaps.
			vim.keymap.set({ "n", "x" }, "<leader>o", function() require("opencode").ask("@this: ", { submit = true }) end,
				{ desc = "Ask opencode…" })
			vim.keymap.set({ "n", "x" }, "<C-x>", function() require("opencode").select() end,
				{ desc = "Execute opencode action…" })
			vim.keymap.set({ "n", "t" }, "<C-q>", function() require("opencode").toggle() end, { desc = "Toggle opencode" })

			vim.keymap.set({ "n", "x" }, "go", function() return require("opencode").operator("@this ") end,
				{ desc = "Add range to opencode", expr = true })
			vim.keymap.set("n", "goo", function() return require("opencode").operator("@this ") .. "_" end,
				{ desc = "Add line to opencode", expr = true })

			vim.keymap.set("n", "<S-C-u>", function() require("opencode").command("session.half.page.up") end,
				{ desc = "Scroll opencode up" })
			vim.keymap.set("n", "<S-C-d>", function() require("opencode").command("session.half.page.down") end,
				{ desc = "Scroll opencode down" })

			-- You may want these if you stick with the opinionated "<C-a>" and "<C-x>" above — otherwise consider "<leader>o…".
			vim.keymap.set("n", "+", "<C-a>", { desc = "Increment under cursor", noremap = true })
			vim.keymap.set("n", "-", "<C-x>", { desc = "Decrement under cursor", noremap = true })
		end,
	}
}
