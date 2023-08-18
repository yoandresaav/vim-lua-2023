local opt = vim.opt
local api = vim.api
local cmd = vim.cmd


-- Basic config
opt.encoding="utf-8"
opt.fileencoding="utf-8"
opt.fileencodings="utf-8"
opt.fileformat="unix"
opt.fileformats="unix"
opt.backup=false
opt.writebackup=false
opt.updatetime=300
opt.signcolumn="yes"


opt.compatible=false
opt.showmatch=true
opt.ignorecase=true
opt.mouse="a"
opt.hlsearch=true
opt.incsearch=true
opt.tabstop=4
opt.expandtab=true
opt.shiftwidth=4
opt.autoindent=true
opt.number=true
opt.relativenumber=true
opt.scrolloff=5
opt.wildmode="longest:full,full"
opt.list=true
opt.listchars="tab:»·,trail:·,nbsp:·,extends:>,precedes:<"

api.nvim_command('filetype plugin indent on')
api.nvim_command('syntax on')

opt.clipboard="unnamedplus"
opt.cursorline=true
opt.ttyfast=true
opt.swapfile=false
opt.termguicolors=true
opt.autowrite=true
opt.modifiable=true

-- config columns 80
opt.colorcolumn="80"

-- config for nvim-tree
-- vim.cmd("colorscheme nightfox")
-- vim.cmd("colorscheme solarized")
vim.cmd("colorscheme onedark")
