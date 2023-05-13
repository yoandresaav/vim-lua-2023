local api = vim.api
local keyset = vim.keymap.set

-- Mapping keys
--

-- Map chadtree
vim.api.nvim_set_keymap('n', '<leader>t', ':CHADopen<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>k', ':call setqflist([])<CR>', {noremap = true, silent = true})


-- Telescope
vim.api.nvim_set_keymap('n', '<leader>ff', ':Telescope find_files hidden=true<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fg', ':Telescope live_grep<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fb', ':Telescope buffers<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>fh', ':Telescope help_tags<CR>', {noremap = true, silent = true})


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


-- Config ps telescope
vim.api.nvim_set_keymap('n', '<leader>ps', ':Telescope live_grep<CR>', {noremap = true, silent = true})


-- Config tabs movement
vim.api.nvim_set_keymap('n', '<leader>.', ':BufferNext<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>,', ':BufferPrevious<CR>', {noremap = true, silent = true})

-- Reoder tabs
vim.api.nvim_set_keymap('n', '<leader>m', ':BufferMovePrevious<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>M', ':BufferMoveNext<CR>', {noremap = true, silent = true})

-- Config tabs keys
vim.api.nvim_set_keymap('n', '<leader>1', ':BufferGoto 1<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>2', ':BufferGoto 2<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>3', ':BufferGoto 3<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>4', ':BufferGoto 4<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>5', ':BufferGoto 5<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>6', ':BufferGoto 6<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>7', ':BufferGoto 7<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>8', ':BufferGoto 8<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>9', ':BufferGoto 9<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>0', ':BufferLast<CR>', {noremap = true, silent = true})

-- Sort automatically by...
-- vim.cmd('autocmd BufWritePost plugins.lua PackerCompile') -- Auto compile when there are changes in plugins.lua
vim.api.nvim_set_keymap('n', '<leader>bb', ':BufferOrderByBufferNumber', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bd', ':BufferOrderByDirectory', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bl', ':BufferOrderByLanguage', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>bw', ':BufferOrderByBufferNumber', {noremap = true, silent = true})

-- Git blame
vim.api.nvim_set_keymap('n', '<leader>gb', ':Git blame<CR>', {noremap = true, silent = true})


-- Find under cursor



-- Config Fugitive
vim.api.nvim_set_keymap('n', '<leader>gs', ':Git blame<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gh', ':diffget //3<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>gu', ':diffget //2<CR>', {noremap = true, silent = true})


-- Config vimspector
vim.api.nvim_set_keymap('n', '<leader>dl', ':call vimspector#Launch()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dr', ':call vimspector#Reset()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dc', ':call vimspector#Continue()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>ds', ':call vimspector#StepOver()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>di', ':call vimspector#StepInto()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>do', ':call vimspector#StepOut()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>de', ':call vimspector#Restart()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>dt', ':call vimspector#Stop()<CR>', {noremap = true, silent = true})
vim.api.nvim_set_keymap('n', '<leader>db', ':call vimspector#ToggleBreakpoint()<CR>', {noremap = true, silent = true})

-- Lua
vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xw", "<cmd>TroubleToggle workspace_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle document_diagnostics<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xl", "<cmd>TroubleToggle loclist<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "<leader>xq", "<cmd>TroubleToggle quickfix<cr>",
  {silent = true, noremap = true}
)
vim.keymap.set("n", "gR", "<cmd>TroubleToggle lsp_references<cr>",
  {silent = true, noremap = true}
)

local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

local telescope = require("telescope")

telescope.setup {
  defaults = {
    mappings = {
      i = { ["<c-t>"] = trouble.open_with_trouble },
      n = { ["<c-t>"] = trouble.open_with_trouble },
    },
  },
}

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
