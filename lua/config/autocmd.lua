
local cmd = vim.cmd


-- " Find word under the cursor
cmd [[
    command! -bang -nargs=* RgExact
      \ call fzf#vim#grep(
      \   'rg -F --column --line-number --no-heading --color=always --smart-case -- '.shellescape(<q-args>), 1,
      \   fzf#vim#with_preview(), <bang>0)

    nmap <Leader>G :execute 'RgExact ' . expand('<cword>') <Cr>
]]

-- cmd('command! Autopep8 %! autopep8 -')
