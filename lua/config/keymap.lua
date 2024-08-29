local api = vim.api
local keyset = vim.keymap.set

-- Local changes
keyset('n', '<leader>nh', ':noh<CR>', {noremap = true, silent = true, desc = 'No highlight' })

-- Incremental / decremental number
keyset('n', '<leader>+', '<C-a>', {noremap = true, silent = true, desc = 'Increment number' })
keyset('n', '<leader>-', '<C-x>', {noremap = true, silent = true, desc = 'Decrement number' })


-- window management
keyset('n', "<leader>sx", "<cmd>close<CR>", { desc = "Close window" })

-- Telescope
local opts = {noremap = true, silent = true}
keyset('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', opts)
keyset('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
keyset('n', '<leader>fb', ':Telescope buffers<CR>', opts)
keyset('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Config tabs movement
keyset('n', '<leader>.', ':BufferNext<CR>', opts)
keyset('n', '<leader>,', ':BufferPrevious<CR>', opts)

-- Config tabs keys
keyset('n', '<leader>1', ':BufferGoto 1<CR>', opts)
keyset('n', '<leader>2', ':BufferGoto 2<CR>', opts)
keyset('n', '<leader>3', ':BufferGoto 3<CR>', opts)
keyset('n', '<leader>4', ':BufferGoto 4<CR>', opts)
keyset('n', '<leader>5', ':BufferGoto 5<CR>', opts)
keyset('n', '<leader>6', ':BufferGoto 6<CR>', opts)
keyset('n', '<leader>7', ':BufferGoto 7<CR>', opts)
keyset('n', '<leader>8', ':BufferGoto 8<CR>', opts)
keyset('n', '<leader>9', ':BufferGoto 9<CR>', opts)
keyset('n', '<leader>0', ':BufferLast<CR>', opts)

-- Reoder tabs
keyset('n', '<leader>m', ':BufferMovePrevious<CR>', opts)
keyset('n', '<leader>M', ':BufferMoveNext<CR>', opts)

-- Sort automatically by...
keyset('n', '<leader>bb', ':BufferOrderByBufferNumber', opts)
keyset('n', '<leader>bd', ':BufferOrderByDirectory', opts)
keyset('n', '<leader>bl', ':BufferOrderByLanguage', opts)
keyset('n', '<leader>bw', ':BufferOrderByBufferNumber', opts)

-- Config Fugitive
keyset('n', '<leader>gb', ':Git blame<CR>', opts)
keyset('n', '<leader>gh', ':diffget //3<CR>', opts)
keyset('n', '<leader>gu', ':diffget //2<CR>', opts)

-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

-- Autocomplete
function _G.check_back_space()
    local col = vim.fn.col('.') - 1
    return col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') ~= nil
end

-- Use Tab for trigger completion with characters ahead and navigate
-- NOTE: There's always a completion item selected by default, you may want to enable
-- no select by setting `"suggest.noselect": true` in your configuration file
-- NOTE: Use command ':verbose imap <tab>' to make sure Tab is not mapped by
-- other plugins before putting this into your config
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}

-- Make <CR> to accept selected completion item or notify coc.nvim to format
-- keyset("i", "<cr>", [[coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"]], opts)

-- Use <c-space> to trigger completion TODO: Check this is possible not work
keyset("i", "<c-a>", "coc#refresh()", {silent = true, expr = true})

-- Coc Format selected text
-- keyset('n', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true, silent = true})
-- keyset('x', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true, silent = true})

-- Coc goto code navigation
local opts = { noremap = true, silent = true }
keyset('n', 'gd', '<Plug>(coc-definition)', opts)
keyset('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
keyset('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
keyset('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})

-- Symbol renamig
keyset('n', '<leader>rn', '<Plug>(coc-rename)', {noremap = true, silent = true})

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = { silent = true, nowait = true }

-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)

-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)

-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)

-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)

-- Search workspace symbols
-- keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
-- Do default action for next item
keyset("n", "<space>j", ":<C-u>CocNext<cr>", opts)

-- Do default action for previous item
keyset("n", "<space>k", ":<C-u>CocPrev<cr>", opts)

-- Resume latest coc list
keyset("n", "<space>p", ":<C-u>CocListResume<cr>", opts)

-- Mappings for CoCDiagnostics
-- Show all diagnostics one file
keyset("n", "<space>cd", ":<C-u>CocDiagnostics<cr>", opts)
-- Go to next diagnostic
keyset("n", "[g", "<Plug>(coc-diagnostic-prev)", {silent = true})
keyset("n", "]g", "<Plug>(coc-diagnostic-next)", {silent = true})

-- Mappings for CoC-Explore actions
keyset("n", "<leader>t", ":<C-u>CocCommand explorer<cr>", opts)
-- keyset("n", "<leader>te", ":<C-u>CocCommand explorer --preset floating<cr>", opts)

-- You probably also want to set a keymap to toggle aerial
keyset("n", "<leader>at", "<cmd>AerialToggle!<CR>")


-- Todos comment keymap
vim.keymap.set("n", "]t", function()
  require("todo-comments").jump_next()
end, { desc = "Next todo comment" })

vim.keymap.set("n", "[t", function()
  require("todo-comments").jump_prev()
end, { desc = "Previous todo comment" })

-- You can also specify a list of valid jump keywords

-- vim.keymap.set("n", "]t", function()
--   require("todo-comments").jump_next({keywords = { "ERROR", "WARNING" }})
-- end, { desc = "Next error/warning todo comment" })
