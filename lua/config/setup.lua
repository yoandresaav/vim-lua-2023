
-- Configue Telescope
-- Path: telescope.lua
-- Configue Treesitter
-- Path: treesitter.lua
-- Configue LSP 

-- require('telescope').load_extension('dap')
-- require("telescope").load_extension("notify")
require('telescope').setup{
  defaults = {
    file_ignore_patterns = {"node_modules", ".venv", "static", "yarn.lock", ".git"}
  },
  pickers = {
    find_files = {
      theme = "dropdown",
    },
    coc_references = {
      theme = 'ivy',
    },
  }
}

-- Configure lualine
require('lualine').setup{
  options = {
    icons_enabled = true,
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = {'mode'},
    -- lua_line_b = {'branch'},
    lualine_c = {{'filename', file_status = true, path = 1}},
  },
}


require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
  -- context_commentstring = {
  --   enable = true,
  --   enable_autocmd = false,
  --   config =  {
  --     javascript = {
  --       __default = '// %s',
  --       jsx_element = '{/* %s */}',
  --       jsx_fragment = '{/* %s */}',
  --       jsx_attribute = '// %s',
  --       comment = '// %s'
  --     }
  --  }
  -- },
  autotag = {
    enable = true,
  },
}

-- styled.M.directives()
-- styled.M.queries()

vim.g.skip_ts_context_commentstring_module = true
require('ts_context_commentstring').setup {}


require('gitsigns').setup {
    current_line_blame = true,
    on_attach = function(bufnr)
      local gs = package.loaded.gitsigns

      local function map(mode, l, r, opts)
        opts = opts or {}
        opts.buffer = bufnr
        vim.keymap.set(mode, l, r, opts)
      end

      -- Navigation
      map('n', ']c', function()
        if vim.wo.diff then return ']c' end
        vim.schedule(function() gs.next_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      map('n', '[c', function()
        if vim.wo.diff then return '[c' end
        vim.schedule(function() gs.prev_hunk() end)
        return '<Ignore>'
      end, {expr=true})

      -- Actions
      map('n', '<leader>hs', gs.stage_hunk)
      map('n', '<leader>hr', gs.reset_hunk)
      map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line("."), vim.fn.line("v")} end)
      map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line("."), vim.fn.line("v")} end)
      map('n', '<leader>hS', gs.stage_buffer)
      map('n', '<leader>hu', gs.undo_stage_hunk)
      map('n', '<leader>hR', gs.reset_buffer)
      map('n', '<leader>hp', gs.preview_hunk)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)

      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

require("auto-save").setup {}

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


-- init.lua

-- Coc configurations
-- vim.api.nvim_exec([[
--   augroup my_coc_config
--     autocmd!
--     autocmd FileType * silent! call CocStart()
--   augroup END
-- ]], false)
--

-- Enable coc-snippets
vim.g.coc_global_extensions = { 'coc-snippets' }

require("mason").setup()
-- require("mason-nvim-dap").setup()
require("mason-lspconfig").setup()
-- require("lspsaga").setup()
-- require('dap')
-- require('dap.ext.vscode').load_launchjs()
-- require('dbg.python')

-- require("onedarkpro").setup({
--   options = {
--     transparency = true,
--     terminal_colors = true,
--     cursorline = true
--   }
-- })



require('dressing').setup({
  input = {
    win_options = {
      winhighlight = 'NormalFloat:DiagnosticError'
    }
  }
})


require("aerial").setup({
  -- optionally use on_attach to set keymaps when aerial has attached to a buffer
  on_attach = function(bufnr)
    -- Jump forwards/backwards with '{' and '}'
    vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
    vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
  end,
})

vim.api.nvim_set_hl(0, 'Comment', { italic=true })

require("oil").setup()




require("noice").setup({
  lsp = {
    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  -- you can enable a preset for easier configuration
  presets = {
    bottom_search = true, -- use a classic bottom cmdline for search
    command_palette = true, -- position the cmdline and popupmenu together
    long_message_to_split = true, -- long messages will be sent to a split
    inc_rename = false, -- enables an input dialog for inc-rename.nvim
    lsp_doc_border = false, -- add a border to hover docs and signature help
  },
})

require('onedark').setup {
    style = 'darker',
    transparent = true,
}
require('onedark').load()

