local api = vim.api
local keyset = vim.keymap.set

-- Telescope
local opts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', opts)

-- Config tabs movement
vim.api.nvim_set_keymap('n', '<leader>.', ':BufferNext<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>,', ':BufferPrevious<CR>', opts)

-- Reoder tabs
vim.api.nvim_set_keymap('n', '<leader>m', ':BufferMovePrevious<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>M', ':BufferMoveNext<CR>', opts)

-- Config tabs keys
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferGoto 1<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferGoto 2<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferGoto 3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferGoto 4<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferGoto 5<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferGoto 6<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferGoto 7<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferGoto 8<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferGoto 9<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>0', ':BufferLast<CR>', opts)

-- Sort automatically by...
-- vim.cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua
vim.api.nvim_set_keymap('n', '<leader>bb', ':BufferOrderByBufferNumber', opts)
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferOrderByDirectory', opts)
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferOrderByLanguage', opts)
vim.api.nvim_set_keymap('n', '<leader>bw', ':BufferOrderByBufferNumber', opts)

-- Git blame
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', opts)

-- Config Fugitive
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git blame<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gh', ':diffget //3<CR>', opts)
vim.api.nvim_set_keymap('n', '<leader>gu', ':diffget //2<CR>', opts)


-- Always show the signcolumn, otherwise it would shift the text each time
-- diagnostics appeared/became resolved
vim.opt.signcolumn = "yes"

local keyset = vim.keymap.set
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


-- Use <c-space> to trigger completion
keyset("i", "<c-space>", "coc#refresh()", {silent = true, expr = true})

-- Coc Format selected text
vim.api.nvim_set_keymap('n', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('x', '<leader>f', '<Plug>(coc-format-selected)', {noremap = true, silent = true})

-- Coc goto code navigation
vim.api.nvim_set_keymap('n', 'gd', '<Plug>(coc-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gy', '<Plug>(coc-type-definition)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gi', '<Plug>(coc-implementation)', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', 'gr', '<Plug>(coc-references)', {noremap = true, silent = true})

-- Symbol renamig
vim.api.nvim_set_keymap('n', '<leader>rn', '<Plug>(coc-rename)', {noremap = true, silent = true})

vim.api.nvim_create_augroup("CocGroup", {})
vim.api.nvim_create_autocmd("CursorHold", {
    group = "CocGroup",
    command = "silent call CocActionAsync('highlight')",
    desc = "Highlight symbol under cursor on CursorHold"
})

-- Mappings for CoCList
-- code actions and coc stuff
---@diagnostic disable-next-line: redefined-local
local opts = {silent = true, nowait = true}
-- Show all diagnostics
keyset("n", "<space>a", ":<C-u>CocList diagnostics<cr>", opts)
-- Manage extensions
keyset("n", "<space>e", ":<C-u>CocList extensions<cr>", opts)
-- Show commands
keyset("n", "<space>c", ":<C-u>CocList commands<cr>", opts)
-- Find symbol of current document
keyset("n", "<space>o", ":<C-u>CocList outline<cr>", opts)
-- Search workspace symbols
keyset("n", "<space>s", ":<C-u>CocList -I symbols<cr>", opts)
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
keyset("n", "<leader>te", ":<C-u>CocCommand explorer --preset floating<cr>", opts)

-- keyset("n", "<leader>K", ":<C-u>CocCommand ShowDocumentation()<cr>", opts)
function _G.show_docs()
    local cw = vim.fn.expand('<cword>')
    if vim.fn.index({'vim', 'help'}, vim.bo.filetype) >= 0 then
        vim.api.nvim_command('h ' .. cw)
    elseif vim.api.nvim_eval('coc#rpc#ready()') then
        vim.fn.CocActionAsync('doHover')
    else
        vim.api.nvim_command('!' .. vim.o.keywordprg .. ' ' .. cw)
    end
end
keyset("n", "K", '<CMD>lua _G.show_docs()<CR>', {silent = true})

-- You probably also want to set a keymap to toggle aerial
vim.keymap.set("n", "<leader>at", "<cmd>AerialToggle!<CR>")

