return {
	--- Defaults everyone can agree on
	'tpope/vim-sensible',

	'nvim-lualine/lualine.nvim',
	'nvim-tree/nvim-web-devicons',

	--- quoting/parenthesizing made simple
	'tpope/vim-surround',

	--- Icons
	'ryanoasis/vim-devicons',

	'SirVer/ultisnips',
	'honza/vim-snippets',

	'mhinz/vim-startify',
	-- 'fatih/vim-go',


	{ 'neoclide/coc.nvim', branch = 'release' },

	{ 'ms-jpq/chadtree', branch = 'chad', build = { 'python3 -m chadtree deps'}},

	 --- Alignment
	'junegunn/vim-easy-align',

	--- Registers
	'junegunn/vim-peekaboo',

	'nvim-lua/popup.nvim',
	'nvim-lua/plenary.nvim',
	'nvim-telescope/telescope.nvim',
	'nvim-telescope/telescope-fzy-native.nvim',

	--- Highlight, edit, and navigate code using a fast incremental parsing library
	{ 'nvim-treesitter/nvim-treesitter', build = ':TSUpdate'},

	-- Golang
	{
		"ray-x/go.nvim",
	  dependencies = {  -- optional packages
		"ray-x/guihua.lua",
		"neovim/nvim-lspconfig",
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
	-- 'kyazdani42/nvim-web-devicons',
	'romgrk/barbar.nvim',

	--- Match tags
	-- 'leafOfTree/vim-matchtag',

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
	'xiyaowong/transparent.nvim',

	-- Integretions with tmux
	{ 'christoomey/vim-tmux-navigator', lazy = false },

	'github/copilot.vim',

	-- 'puremourning/vimspector',

	-- -- trouble
	-- 'folke/trouble.nvim',

	-- todo comments
	-- 'folke/todo-comments.nvim',
	--
	-- { "folke/neodev.nvim", opts = {} },
	-- Debug
	-- {
	-- lazy = true,
    -- "rcarriga/nvim-dap-ui",
    -- dependencies = "mfussenegger/nvim-dap",
    -- config = function()
      -- local dap = require("dap")
      -- local dapui = require("dapui")
      -- dapui.setup()
      -- dap.listeners.after.event_initialized["dapui_config"] = function()
        -- dapui.open()
      -- end
      -- dap.listeners.before.event_terminated["dapui_config"] = function()
        -- dapui.close()
      -- end
      -- dap.listeners.before.event_exited["dapui_config"] = function()
        -- dapui.close()
      -- end
    -- end
  -- },
    -- "mfussenegger/nvim-dap",
  -- {
    -- "mfussenegger/nvim-dap-python",
    -- ft = "python",
    -- dependencies = {
      -- "mfussenegger/nvim-dap",
      -- "rcarriga/nvim-dap-ui",
    -- },
	-- config = function(_, opts)
      -- local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
      -- require("dap-python").setup(path)
      -- -- require("core.utils").load_mappings("dap_python")
    -- end,
  -- },
  -- {
    -- "jose-elias-alvarez/null-ls.nvim",
    -- ft = {"python"},
    -- opts = function()
      -- return require "config.null-ls"
    -- end,
  -- },
   -- {
    -- "neovim/nvim-lspconfig",
  -- },
  -- {
    -- "williamboman/mason.nvim",
	-- build = ":MasonUpdate",
    -- opts = {
      -- ensure_installed = {
        -- "black",
        -- "debugpy",
        -- "mypy",
        -- "ruff",
        -- "pyright",
      -- },
    -- },
  -- },
}

