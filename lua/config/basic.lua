local opt = vim.opt


-- Basic config
vim.opt.encoding="utf-8"
vim.opt.fileencoding="utf-8"
vim.opt.fileencodings="utf-8"
vim.opt.fileformat="unix"
vim.opt.fileformats="unix"
opt.backup=false
opt.writebackup=false
opt.updatetime=300
opt.signcolumn="yes"


vim.opt.compatible=false
vim.opt.showmatch=true
vim.opt.ignorecase=true
vim.opt.mouse="a"
vim.opt.hlsearch=true
vim.opt.incsearch=true
vim.opt.tabstop=4
vim.opt.expandtab=true
vim.opt.shiftwidth=4
vim.opt.autoindent=true
vim.opt.number=true
vim.opt.relativenumber=true
vim.opt.scrolloff=5
vim.opt.wildmode="longest:full,full"
vim.opt.list=true
vim.opt.listchars="tab:»·,trail:·,nbsp:·,extends:>,precedes:<"

vim.api.nvim_command('filetype plugin indent on')
vim.api.nvim_command('syntax on')

vim.opt.clipboard="unnamedplus"
vim.opt.cursorline=true
vim.opt.ttyfast=true
vim.opt.swapfile=false
vim.opt.termguicolors=true
vim.opt.autowrite=true
vim.opt.modifiable=true

-- config columns 80
vim.opt.colorcolumn="80"

-- config for nvim-tree
-- vim.cmd("colorscheme nightfox")
vim.cmd("colorscheme solarized")
