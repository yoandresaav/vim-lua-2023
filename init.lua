-- Yondre Saavedra 2023
-- oil.vim plugin for file management (editing files like a buffer) seems ok, lets try in the next

-- mapleader should be setup before lazy
vim.g.mapleader = " "


local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins",{
  install = { colorscheme = { "tokyonight", "habamax" } },
  defauls = {
    colorscheme = "tokyonight",
    lazy = false,
  },
  spec = {
    { "LazyVim/LazyVim", import = "lazyvim.plugins" },
    { import = "plugins" },
  },
  ui = {
    border = "rounded",
 },
  performance = {
    rtp = {
      disabled_plugins = {
        "gzip",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
        "ftp"
      }
    }
  }
})

-- close lazy panel with esc
vim.api.nvim_create_autocmd("FileType", {
  pattern = {
    "lazy",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "<Esc>", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end
})

require('config.basic')
-- require('config.global') -- go syntax definitions
require('config.keymap')
-- local styled = require('config.styled')
require('config.setup')
require('config.autocmd')
-- require('config.format')
-- require('config.dap')

