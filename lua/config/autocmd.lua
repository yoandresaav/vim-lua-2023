
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

-- " Find word under the cursor
cmd [[
    command! -bang -nargs=* RgExact
      \ call fzf#vim#grep(
      \   'rg -F --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

    nmap <Leader>G :execute 'RgExact ' . expand('<cword>') <Cr>
]]

-- cmd [[
--     " (Line-wrapped for legibility)
--     autocmd BufReadPre *
--         \ let f=getfsize(expand("<afile>"))
--         \ | if f > 100000 || f == -2
--         \ | let b:copilot_enabled = v:false
--         \ | endif
-- ]]
