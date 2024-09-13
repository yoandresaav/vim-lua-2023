local opt = vim.opt
local api = vim.api
local cmd = vim.cmd

-- Basic config
opt.encoding = "utf-8"
opt.fileencoding = "utf-8"
opt.fileencodings = "utf-8"
opt.fileformat = "unix"
opt.fileformats = "unix"
opt.backup = false
opt.sessionoptions:append("unix,slash")
opt.writebackup = false
opt.updatetime = 300
opt.signcolumn = "yes"
opt.history = 50

opt.compatible = false
opt.showmatch = true
opt.showcmd = true -- Show command in status line
opt.ignorecase = true
opt.mouse = "a"
opt.hlsearch = true
opt.incsearch = true
opt.inccommand = "split"
opt.tabstop = 4
opt.expandtab = true
opt.shiftwidth = 4
opt.autoindent = true -- Copy indent from current line
opt.smartindent = true
opt.number = true
opt.relativenumber = true
opt.scrolloff = 10
opt.wildmode = "longest:full,full"
opt.wildignore:append({ ".git", "node_modules", "dist", ".venv" })
opt.wildoptions = "pum"
opt.list = true
opt.listchars = "tab:»·,trail:·,nbsp:·,extends:>,precedes:<"
opt.backspace = "indent,eol,start" -- Where in Insert mode the backspace key can be used
opt.wrap = false
-- opt.shell='fish'
opt.shell = "zsh"
opt.breakindent = true
opt.laststatus = 2

api.nvim_command("filetype plugin indent on")
api.nvim_command("syntax on")

opt.clipboard = "unnamedplus"
opt.cursorline = true
opt.ttyfast = true
opt.swapfile = false
opt.termguicolors = true
opt.pumblend = 5
opt.winblend = 0
opt.autowrite = true
opt.modifiable = true

opt.background = "dark"
opt.colorcolumn = "80"
