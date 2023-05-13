
-- Configue Telescope
-- Path: telescope.lua
-- Configue Treesitter
-- Path: treesitter.lua
-- Configue LSP


require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".venv", "static", "yarn.lock", ".git"}
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    }
  }
}

-- Configure lualine
require('lualine').setup{
  sections = {
    lualine_c = {{'filename', file_status = true, path = 1}},
  },
}


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
}
require('gitsigns').setup {
    current_line_blame = true,
}
require("auto-save").setup {}

require('trouble').setup {}
require('todo-comments').setup {}
require('go').setup({
  trouble = true,
})

-- Coc Config
-- Setup formatexpr specified filetype(s)
vim.api.nvim_create_autocmd("FileType", {
    group = "CocGroup",
    pattern = "typescript,json",
    command = "setl formatexpr=CocAction('formatSelected')",
    desc = "Setup formatexpr specified filetype(s)."
})

-- Update signature help on jump placeholder
vim.api.nvim_create_autocmd("User", {
    group = "CocGroup",
    pattern = "CocJumpPlaceholder",
    command = "call CocActionAsync('showSignatureHelp')",
    desc = "Update signature help on jump placeholder"
})

--
