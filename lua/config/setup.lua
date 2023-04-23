
-- Configue Telescope
-- Path: telescope.lua
-- Configue Treesitter
-- Path: treesitter.lua
-- Configue LSP


require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".venv", ".env", "static", "yarn.lock"}
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  }
}

-- Configure lualine
require('lualine').setup()


require'nvim-treesitter.configs'.setup {
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config =  {
      javascript = {
        __default = '// %s',
        jsx_element = '{/* %s */}',
        jsx_fragment = '{/* %s */}',
        jsx_attribute = '// %s',
        comment = '// %s'
      }
   }
  },
  autotag = {
      enable = true,
  }
}
require('gitsigns').setup {
    current_line_blame = true,
}
require("true-zen").setup {}
require("auto-save").setup {}
