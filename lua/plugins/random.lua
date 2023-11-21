return {
	--- Defaults everyone can agree on
	'tpope/vim-sensible',

	'SirVer/ultisnips',
	'honza/vim-snippets',
	'quangnguyen30192/cmp-nvim-ultisnips',


	--- CMP
 	'hrsh7th/nvim-cmp',
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
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-fzy-native.nvim',


	'nvim-lualine/lualine.nvim',
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
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

	-- Golang
	{
		"ray-x/go.nvim",
	  dependencies = {  -- optional packages
		"ray-x/guihua.lua",
	    'neovim/nvim-lspconfig',
		"nvim-treesitter/nvim-treesitter",
	  },
	  config = function()
		require("go").setup()
	  end,
	  event = {"CmdlineEnter"},
	  ft = {"go", 'gomod'},
	  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
	},

	--- comments for jsx,tsx
	'tpope/vim-commentary',
	'JoosepAlviste/nvim-ts-context-commentstring',

	--- Javascript syntax
	'pangloss/vim-javascript',
	'leafgarland/typescript-vim',
	'maxmellon/vim-jsx-pretty',
	'peitalin/vim-jsx-typescript',

	--- Configure TABS
	'romgrk/barbar.nvim',

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
	'https://gitlab.com/gi1242/vim-emoji-ab.git',

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
	  event = { "InsertEnter", "LspAttach" },
	  fix_pairs = true,
	  config = function ()
		require("copilot_cmp").setup()
	  end
	},

	-- Tags
	{ 'kristijanhusak/vim-js-file-import', build = 'npm install' },
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
	'rcarriga/nvim-notify',
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
		}
	}
}
