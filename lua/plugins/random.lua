return {
	--- Defaults everyone can agree on
	"tpope/vim-sensible",

	{ "Sirver/ultisnips", event = { "InsertEnter" } },
	-- 'honza/vim-snippets',

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		config = function()
			local mason = require("mason")

			local mason_lspconfig = require("mason-lspconfig")

			local mason_tool_installer = require("mason-tool-installer")

			mason.setup({
				ui = {
					icons = {
						package_installed = "",
						package_not_installed = "",
						package_pending = "",
						package_uninstalling = "",
					},
				},
			})

			mason_lspconfig.setup({
				ensure_installed = {
					"cssls",
					"graphql",
					"html",
					"lua_ls",
					"tsserver",
					"tailwindcss",
					"emmet_ls",
					"pyright",
				},
			})

			mason_tool_installer.setup({
				ensure_installed = {
					"prettier",
					"stylua",
					"isort",
					"black",
					"pylint",
					"eslint_d",
				},
			})
		end,
	},

	-- Adds vscode-like pictograms to neovim built-in lsp
	"onsails/lspkind.nvim",

	"nvim-lua/plenary.nvim",
	"nvim-lua/popup.nvim",

	-- add telescope-fzf-native
	{
		"telescope.nvim",
		dependencies = {
			"nvim-telescope/telescope-fzf-native.nvim",
			"jvgrootveld/telescope-zoxide",
			build = "make",
			config = function()
				require("telescope").load_extension("fzf")
				vim.wo.foldmethod = "expr"
				vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
				-- vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
				-- vim.wo.fillchars = "fold:\\"
				-- vim.wo.foldnestmax = 3
				-- vim.wo.foldminlines = 1
			end,
		},
		keys = {
			{ "<leader>fz", "<cmd>Telescope zoxide list<cr>", desc = "Recent Folders" },
		},
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			{ "Pheon-Dev/pigeon", opts = {} },
		},
		event = "VeryLazy",
		requires = {
			"kyazdani42/nvim-web-devicons", opt = true,
		},
		use {
			'nvim-telescope/telescope.nvim', tag = '0.1.0'.
			requires = {{ 'nvim-lua/plenary.nvim' }}
		}
	},

	"nvim-tree/nvim-web-devicons",

	--- quoting/parenthesizing made simple
	"tpope/vim-surround",

	--- Icons
	"ryanoasis/vim-devicons",

	-- Startify
	"mhinz/vim-startify",
	"fatih/vim-go",

	{ "neoclide/coc.nvim", branch = "release" },

	--- Alignment
	"junegunn/vim-easy-align",

	--- Registers
	"junegunn/vim-peekaboo",

	--- Highlight, edit, and navigate code using a fast incremental parsing library
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		-- event = { "LazyFile", "VeryLazy" },
		init = function(plugin)
			-- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
			-- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
			-- no longer trigger the **nvim-treeitter** module to be loaded in time.
			-- Luckily, the only thins that those plugins need are the custom queries, which we make available
			-- during startup.
			require("lazy.core.loader").add_to_rtp(plugin)
			require("nvim-treesitter.query_predicates")
		end,
		dependencies = {
			{
				"nvim-treesitter/nvim-treesitter-textobjects",
				config = function()
					-- When in diff mode, we want to use the default
					-- vim text objects c & C instead of the treesitter ones.
					local move = require("nvim-treesitter.textobjects.move") ---@type table<string,fun(...)>
					local configs = require("nvim-treesitter.configs")
					for name, fn in pairs(move) do
						if name:find("goto") == 1 then
							move[name] = function(q, ...)
								if vim.wo.diff then
									local config = configs.get_module("textobjects.move")[name] ---@type table<string,string>
									for key, query in pairs(config or {}) do
										if q == query and key:find("[%]%[][cC]") then
											vim.cmd("normal! " .. key)
											return
										end
									end
								end
								return fn(q, ...)
							end
						end
					end
				end,
			},
		},
		cmd = { "TSUpdateSync", "TSUpdate", "TSInstall" },
		keys = {
			{ "<c-space>", desc = "Increment selection" },
			{ "<bs>", desc = "Decrement selection", mode = "x" },
		},
		opts = {
			ensure_installed = {
				"bash",
				"html",
				"javascript",
				"json",
				"lua",
				"markdown",
				"markdown_inline",
				"python",
				"query",
				"regex",
				"tsx",
				"typescript",
				"vim",
				"yaml",
				"css",
				"scss",
				"cpp",
			},
		},
	},

	--- comments for jsx,tsx
	"tpope/vim-commentary",
	"JoosepAlviste/nvim-ts-context-commentstring",

	--- Javascript syntax
	"pangloss/vim-javascript",
	"leafgarland/typescript-vim",

	-- React syntax
	"maxmellon/vim-jsx-pretty",
	"peitalin/vim-jsx-typescript",

	--- Configure TABS for buffers
	{
		"romgrk/barbar.nvim",
		dependencies = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
		},
		init = function()
			vim.g.barbar_auto_setup = true
		end,
	},

	--- Match tags
	"Darazaki/indent-o-matic",
	{ "styled-components/vim-styled-components", branch = "main" },

	-- ident
	"lukas-reineke/indent-blankline.nvim",

	--- Git
	"tpope/vim-fugitive",
	"lewis6991/gitsigns.nvim",

	--- FZF
	{ "junegunn/fzf", build = ":call fzf#install()" },

	-- "junegunn/fzf.vim",

	"Pocco81/auto-save.nvim",

	-- Integretions with tmux
	{ "christoomey/vim-tmux-navigator", lazy = false },

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {}, -- this is equalent to setup({}) function
	},

	"windwp/nvim-ts-autotag",

	{
		"stevearc/dressing.nvim",
		opts = {},
		config = function()
			require("dressing").setup({
				input = {
					win_options = {
						winhighlight = "NormalFloat:DiagnosticError",
					},
				},
			})
		end,
	},

	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	{
		"stevearc/aerial.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = {
			"nvim-treesitter/nvim-treesitter",
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- { "jose-elias-alvarez/null-ls.nvim",
	-- 	config = function()
	-- 		local null_ls = require("null-ls")
	-- 		null_ls.setup({
	-- 			sources = {
	-- 				null_ls.builtins.formatting.stylua,
	-- 				null_ls.builtins.formatting.clang_format,
	-- 				null_ls.builtins.formatting.eslint,
	-- 				null_ls.builtins.formatting.black,
	-- 				null_ls.builtins.diagnostics.eslint,
	-- 				null_ls.builtins.completion.spell,
	-- 				null_ls.builtins.diagnostics.pylint.with({
	-- 				  diagnostics_postprocess = function(diagnostic)
	-- 					diagnostic.code = diagnostic.message_id
	-- 				  end,
	-- 				  prefer_local = ".venv/bin"
	-- 				}),
	-- 				null_ls.builtins.formatting.isort,
	-- 				null_ls.builtins.formatting.black,
	-- 			}
	-- 		})
	-- 	end,
	-- 	dependencies = { "nvim-lua/plenary.nvim" },
	-- },

	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"github/copilot.vim",
		init = function()
			vim.g.copilot_no_tab_map = true
		end,
		config = function()
			vim.keymap.set("i", "<C-e>", [[copilot#Accept("\<CR>")]], {
				silent = true,
				expr = true,
				script = true,
				replace_keycodes = false,
			})
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {
			-- add any options here
		},
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
			-- OPTIONAL:
			--   `nvim-notify` is only needed, if you want to use the notification view.
			--   If not available, we use `mini` as the fallback
			"rcarriga/nvim-notify",
		},
	},

	{
		"rcarriga/nvim-notify",
		keys = {
			{
				"<leader>un",
				function()
					require("notify").dismiss({ silent = true, pending = true })
				end,
				desc = "Dismiss all Notifications",
			},
		},
		opts = {
			timeout = 3000,
			max_height = function()
				return math.floor(vim.o.lines * 0.75)
			end,
			max_width = function()
				return math.floor(vim.o.columns * 0.75)
			end,
			on_open = function(win)
				vim.api.nvim_win_set_config(win, { zindex = 100 })
			end,
		},
		init = function()
			-- when noice is not enabled, install notify on VeryLazy
			-- if not Util.has("noice.nvim") then
			--   Util.on_very_lazy(function()
			-- 	vim.notify = require("notify")
			--   end)
			-- end
		end,
		config = function()
			require("notify").setup({
				background_colour = "#000000",
			})
		end,
	},

	-- Lua
	{
		"folke/twilight.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},

	-- Lua
	{
		"folke/zen-mode.nvim",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
	{ "David-Kunz/gen.nvim" },
	{
		"willothy/wezterm.nvim",
		config = true,
	},
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", "folke/todo-comments.nvim" },
		keys = {
			{ "<leader>xx", "<cmd>TroubleToggle<cr>", desc = "Trouble" },
			{ "<leader>xw", "<cmd>Trouble workspace_diagnostics<cr>", desc = "Trouble Workspace Diagnostics" },
			{ "<leader>xd", "<cmd>Trouble document_diagnostics<cr>", desc = "Trouble Document Diagnostics" },
			{ "<leader>xl", "<cmd>Trouble loclist<cr>", desc = "Trouble Location List" },
			{ "<leader>xq", "<cmd>Trouble quickfix<cr>", desc = "Trouble Quickfix" },
			{ "<leader>xt", "<cmd>TodoTrouble<cr>", desc = "Open todos in Trouble References" },
		},
	},
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					typescriptreact = { "prettier" },
					javascriptreact = { "prettier" },
					css = { "prettier" },
					scss = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					graphql = { "prettier" },
					lua = { "stylua" },
					python = { "isort", "black" },
					go = { "gofmt", "goimports" },
					rust = { "rustfmt" },
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>mp", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 1000,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lint = require("lint")
			lint.linters_by_ft = {
				javascript = { "eslint_d" },
				typescript = { "eslint_d" },
				javascriptreact = { "eslint_d" },
				typescriptreact = { "eslint_d" },
				python = { "pylint" },
			}

			local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })

			vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
				group = lint_augroup,
				callback = function()
					lint.try_lint()
				end,
			})

			vim.keymap.set("n", "<leader>l", function()
				lint.try_lint()
			end, { desc = "Lint current file" })
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
	},
}
