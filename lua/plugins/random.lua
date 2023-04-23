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
	'fatih/vim-go',

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
	'leafOfTree/vim-matchtag',

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

	'Pocco81/true-zen.nvim',
	'Pocco81/auto-save.nvim',

	'https://gitlab.com/gi1242/vim-emoji-ab.git',
	'xiyaowong/transparent.nvim',

	'github/copilot.vim',
}

