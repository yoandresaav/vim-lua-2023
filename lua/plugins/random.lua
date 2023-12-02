return {
	--- Defaults everyone can agree on
	'tpope/vim-sensible',

	'SirVer/ultisnips',
	'honza/vim-snippets',
	-- 'quangnguyen30192/cmp-nvim-ultisnips',

	--- CMP
 	{ 'hrsh7th/nvim-cmp',
		dependencies = {
			{ "quangnguyen30192/cmp-nvim-ultisnips",
				config = function()
					require("cmp_nvim_ultisnips").setup{}
				end
			},
			"hrsh7th/cmp-nvim-lsp",
		},
		config = function()
			local cmp_ultisnips_mappings = require("cmp_nvim_ultisnips.mappings")
			require("cmp").setup({
			  snippet = {
				expand = function(args)
				  vim.fn["UltiSnips#Anon"](args.body)
				end,
			  },
			  sources = {
				{ name = "ultisnips" },
				-- more sources
			  },
			  -- recommended configuration for <Tab> people:
			  -- mapping = {
				-- ["<Tab>"] = cmp.mapping(
				  -- function(fallback)
					-- cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
				  -- end,
				  -- { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
				-- ),
				-- ["<S-Tab>"] = cmp.mapping(
				  -- function(fallback)
					-- cmp_ultisnips_mappings.jump_backwards(fallback)
				  -- end,
				  -- { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
				-- ),
			  -- },
			})
		end
	},
	-- {
	--   "L3MON4D3/LuaSnip",
	--   build = (not jit.os:find("Windows"))
	-- 	  and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
	-- 	or nil,
	--   dependencies = {
	-- 	"rafamadriz/friendly-snippets",
	-- 	config = function()
	-- 	  require("luasnip.loaders.from_vscode").lazy_load()
	-- 	end,
	--   },
	--   opts = {
	-- 	history = true,
	-- 	delete_check_events = "TextChanged",
	--   },
	--   -- stylua: ignore
	--   keys = {
	-- 	{
	-- 	  "<tab>",
	-- 	  function()
	-- 		return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
	-- 	  end,
	-- 	  expr = true, silent = true, mode = "i",
	-- 	},
	-- 	{ "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
	-- 	{ "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
	--   },
	-- },
	-- {
	--   "L3MON4D3/LuaSnip",
	--   build = (not jit.os:find("Windows"))
	-- 	  and "echo 'NOTE: jsregexp is optional, so not a big deal if it fails to build'; make install_jsregexp"
	-- 	or nil,
	--   dependencies = {
	-- 	"rafamadriz/friendly-snippets",
	-- 	config = function()
	-- 	  require("luasnip.loaders.from_vscode").lazy_load()
	-- 	end,
	--   },
	--   opts = {
	-- 	history = true,
	-- 	delete_check_events = "TextChanged",
	--   },
	--   -- stylua: ignore
	--   keys = {
	-- 	{
	-- 	  "<tab>",
	-- 	  function()
	-- 		return require("luasnip").jumpable(1) and "<Plug>luasnip-jump-next" or "<tab>"
	-- 	  end,
	-- 	  expr = true, silent = true, mode = "i",
	-- 	},
	-- 	{ "<tab>", function() require("luasnip").jump(1) end, mode = "s" },
	-- 	{ "<s-tab>", function() require("luasnip").jump(-1) end, mode = { "i", "s" } },
	--   },
	-- },

	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	'neovim/nvim-lspconfig',
	'hrsh7th/cmp-nvim-lsp',
	'hrsh7th/cmp-buffer',
	'hrsh7th/cmp-path',
	'hrsh7th/cmp-cmdline',

	-- Adds vscode-like pictograms to neovim built-in lsp
	'onsails/lspkind.nvim',

	'nvim-lua/plenary.nvim',
	'nvim-lua/popup.nvim',

	-- add telescope-fzf-native
	{
		"telescope.nvim",
		dependencies = {
		  "nvim-telescope/telescope-fzf-native.nvim",
		  build = "make",
		  config = function()
			require("telescope").load_extension("fzf")
			-- vim.wo.foldmethod = "expr"
			-- vim.wo.foldexpr = "nvim_treesitter#foldexpr()"
			-- vim.wo.foldtext = [[substitute(getline(v:foldstart),'\\t',repeat('\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) ]]
			-- vim.wo.fillchars = "fold:\\"
			-- vim.wo.foldnestmax = 3
			-- vim.wo.foldminlines = 1
		  end,
		},
	},

	{ 'nvim-lualine/lualine.nvim', event = "VeryLazy" },
	'nvim-tree/nvim-web-devicons',

	--- quoting/parenthesizing made simple
	'tpope/vim-surround',

	--- Icons
	'ryanoasis/vim-devicons',

	-- Startify
	'mhinz/vim-startify',
	-- 'fatih/vim-go',
	{ 'neoclide/coc.nvim', branch = 'release' },

	 --- Alignment
	'junegunn/vim-easy-align',

	--- Registers
	'junegunn/vim-peekaboo',

	--- Highlight, edit, and navigate code using a fast incremental parsing library
	{ 'nvim-treesitter/nvim-treesitter',
		build = ':TSUpdate', 
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
				"scss"
			},
		},
	},

	-- Golang
	-- {
	-- 	"ray-x/go.nvim",
	-- 	dependencies = {  -- optional packages
	-- 		"ray-x/guihua.lua",
	-- 		'neovim/nvim-lspconfig',
	-- 		"nvim-treesitter/nvim-treesitter",
	-- 	},
	-- 	config = function()
	-- 		require("go").setup()
	-- 	end,
	-- 	event = {"CmdlineEnter"},
	-- 	ft = {"go", 'gomod'},
	-- 	build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	-- },
	
	--- comments for jsx,tsx
	-- TODO: just removed
	'tpope/vim-commentary',  
	'JoosepAlviste/nvim-ts-context-commentstring',

	--- Javascript syntax
	'pangloss/vim-javascript',
	'leafgarland/typescript-vim',

	-- React syntax
	'maxmellon/vim-jsx-pretty',
	'peitalin/vim-jsx-typescript',

	--- Configure TABS for buffers
	{'romgrk/barbar.nvim', 
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
		},
		init = function() vim.g.barbar_auto_setup = true end,
	},

	--- Match tags
	'Darazaki/indent-o-matic',
	{ 'styled-components/vim-styled-components', branch = 'main' },

	-- ident
	'lukas-reineke/indent-blankline.nvim',

	--- Git
	'tpope/vim-fugitive',
	'lewis6991/gitsigns.nvim',

	--- FZF
	{ "junegunn/fzf", build = ":call fzf#install()" },
	'junegunn/fzf.vim',

	'Pocco81/auto-save.nvim',
	-- 'https://gitlab.com/gi1242/vim-emoji-ab.git',



	-- Integretions with tmux
	{ 'christoomey/vim-tmux-navigator', lazy = false },
	{
	  "zbirenbaum/copilot.lua",
	  cmd = "Copilot",
	  event = "InsertEnter",
	  config = function()
		require("copilot").setup({
			suggestion = { enabled = false },
			panel = { enabled = false },
		})
	  end,
	},
	{
	  "zbirenbaum/copilot-cmp",
	  -- after = { "copilot.lua" },
	  -- event = { "InsertEnter", "LspAttach" },
	  -- fix_pairs = true,
	  config = function ()
		require("copilot_cmp").setup()
	  end
	},

	-- CTags
	-- { 'kristijanhusak/vim-js-file-import', build = 'npm install' },
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {} -- this is equalent to setup({}) function
	},
	'windwp/nvim-ts-autotag',

	-- 'mfussenegger/nvim-dap',
	-- "jay-babu/mason-nvim-dap.nvim",
	-- 'nvim-telescope/telescope-dap.nvim',
	-- { 'mfussenegger/nvim-dap-python',
	-- 	ft = 'python',
	-- 	dependencies = { 
	-- 		'mfussenegger/nvim-dap',
	-- 		"rcarriga/nvim-dap-ui",
	-- 	}
	-- },
	--
	-- 'rcarriga/nvim-notify',
	--
	-- {
	-- 	"rcarriga/nvim-dap-ui",
	-- 		dependencies = "mfussenegger/nvim-dap",
	-- 		config = function()
	-- 		  local dap = require("dap")
	-- 		  local dapui = require("dapui")
	-- 		  dapui.setup()
	-- 		  dap.listeners.after.event_initialized["dapui_config"] = function()
	-- 			dapui.open()
	-- 		  end
	-- 		  dap.listeners.before.event_terminated["dapui_config"] = function()
	-- 			dapui.close()
	-- 		  end
	-- 		  dap.listeners.before.event_exited["dapui_config"] = function()
	-- 			dapui.close()
	-- 		  end
	-- 		end
	-- },
	-- {
	--   "folke/noice.nvim",
	--   event = "VeryLazy",
	--   opts = {
	-- 	-- add any options here
	--   },
	--   dependencies = {
	-- 	-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
	-- 	"MunifTanjim/nui.nvim",
	-- 	-- OPTIONAL:
	-- 	--   `nvim-notify` is only needed, if you want to use the notification view.
	-- 	--   If not available, we use `mini` as the fallback
	-- 	-- "rcarriga/nvim-notify",
	-- 	}
	-- },
	{
		'stevearc/dressing.nvim',
		opts = {},
		config = function()
			require('dressing').setup({
			  input = {
				win_options = {
				  winhighlight = 'NormalFloat:DiagnosticError'
				}
			  }
			})
		end,
	},
	-- "dstein64/vim-startuptime",
	-- https://github.com/folke/todo-comments.nvim
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
	  'stevearc/aerial.nvim',
	  opts = {},
	  -- Optional dependencies
	  dependencies = {
		 "nvim-treesitter/nvim-treesitter",
		 "nvim-tree/nvim-web-devicons"
	  },
	},
	{'akinsho/toggleterm.nvim', version = "*", config = true},
	{ "jose-elias-alvarez/null-ls.nvim", 
		config = function()
			local null_ls = require("null-ls")
			null_ls.setup({
				sources = {
					null_ls.builtins.formatting.stylua,
					null_ls.builtins.formatting.clang_format,
					null_ls.builtins.formatting.eslint,
					null_ls.builtins.formatting.lua_format,
					null_ls.builtins.diagnostics.eslint,
					null_ls.builtins.completion.spell,
					null_ls.builtins.diagnostics.pylint.with({
					  diagnostics_postprocess = function(diagnostic)
						diagnostic.code = diagnostic.message_id
					  end,
					}),
					null_ls.builtins.formatting.isort,
					null_ls.builtins.formatting.black,
				}
			}) 
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
	'xiyaowong/telescope-emoji.nvim',
}
