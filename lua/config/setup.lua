
-- Configue Telescope
-- Path: telescope.lua
-- Configue Treesitter
-- Path: treesitter.lua
-- Configue LSP


-- require('telescope').load_extension('dap')
-- require("telescope").load_extension("notify")
require('telescope'). setup{
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
      map('n', '<leader>hb', function() gs.blame_line{full=true} end)
      map('n', '<leader>tb', gs.toggle_current_line_blame)
      map('n', '<leader>hd', gs.diffthis)
      map('n', '<leader>hD', function() gs.diffthis('~') end)
      map('n', '<leader>td', gs.toggle_deleted)

      -- Text object
      map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>')
    end
}

require("auto-save").setup {}

-- require('trouble').setup {}
-- require('todo-comments').setup {}
require('go').setup({
  -- trouble = true,
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

-- init.lua

-- Coc configurations
-- vim.api.nvim_exec([[
--   augroup my_coc_config
--     autocmd!
--     autocmd FileType * silent! call CocStart()
--   augroup END
-- ]], false)
--
-- CMP
local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end
local lspkind = require('lspkind')
local cmp = require'cmp'
cmp.setup {
  -- snippet = {
  --   expand = function(args)
  --     vim.fn["UltiSnips#Anon"](args.body)
  --   end,
  -- },
   -- mapping = cmp.mapping.preset.insert({
   --        ['<Tab>'] = function(fallback)
   --          if cmp.visible() then
   --            cmp.select_next_item()
   --          else
   --            fallback()
   --          end
   --        end,
   --        ['<S-Tab>'] = function(fallback)
   --          if cmp.visible() then
   --            cmp.select_prev_item()
   --          else
   --            fallback()
   --          end
   --        end,
   --        ['<CR>'] = cmp.mapping.confirm({ select = true }),
   --        ['<C-e>'] = cmp.mapping.abort(),
   --        ['<Esc>'] = cmp.mapping.close(),
   --        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
   --        ['<C-f>'] = cmp.mapping.scroll_docs(4),
  -- }),
  mapping = {
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),
   ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },

  -- sources = {
  --   -- Copilot Source
  --   { name = "copilot", group_index = 2 },
  --   -- Other Sources
  --   { name = 'ultisnips', group_index = 2 },
  --   -- { name = 'nvim_lsp', group_index = 2 },
  --   -- { name = 'buffer', keyword_length = 4 }, -- for buffer word completion
  -- },


  sources = {
    -- Copilot Source
    { name = "copilot", group_index = 2 },
    -- Other Sources
    { name = "nvim_lsp", group_index = 2 },
    { name = "path", group_index = 2 },
    { name = "luasnip", group_index = 2 },
  },


  completion = {
    keyword_length = 1,
    completeopt = "menu,noselect"
  },
  -- view = {
  --   entries = 'custom',
  -- },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol', -- show only symbol annotations
      maxwidth = 100, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
      ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
      symbol_map = { Copilot = "" },

      -- The function below will be called before any actual modifications from lspkind
      -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
      -- before = function (entry, vim_item)
      --   return vim_item
      -- end
    })
  },
  sorting = {
    priority_weight = 2,
    comparators = {
      require("copilot_cmp.comparators").prioritize,

      -- Below is the default comparitor list and order for nvim-cmp
      cmp.config.compare.offset,
      -- cmp.config.compare.scopes, --this is commented in nvim-cmp too
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.recently_used,
      cmp.config.compare.locality,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
}


-- `/` cmdline setup.
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- `:` cmdline setup.
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    {
      name = 'cmdline',
      option = {
        ignore_cmds = { 'Man', '!' }
      }
    }
  })
})

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

-- vim.notify = require("notify")

-- require("noice").setup({
--   lsp = {
--     override = {
--       ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
--       ["vim.lsp.util.stylize_markdown"] = true,
--       ["cmp.entry.get_documentation"] = true,
--     },
--   },
--   -- you can enable a preset for easier configuration
--   presets = {
--     bottom_search = true, -- use a classic bottom cmdline for search
--     command_palette = true, -- position the cmdline and popupmenu together
--     long_message_to_split = true, -- long messages will be sent to a split
--     inc_rename = false, -- enables an input dialog for inc-rename.nvim
--     lsp_doc_border = false, -- add a border to hover docs and signature help
--   },
-- })

require('dressing').setup({
  input = {
    win_options = {
      winhighlight = 'NormalFloat:DiagnosticError'
    }
  }
})
