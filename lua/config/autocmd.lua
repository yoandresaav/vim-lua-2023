
local cmd = vim.cmd

-- cmd [[
--     augroup reactgroup
--         autocmd!
--         autocmd BufEnter *.{js,jsx,ts,tsx} :syntax sync fromstart
--         autocmd BufLeave *.{js,jsx,ts,tsx} :syntax sync clear
--         autocmd BufNewFile,BufRead *.tsx set filetype=typescriptreact
--         autocmd BufNewFile,BufRead *.jsx set filetype=javascriptreact
--     augroup end
-- ]]
