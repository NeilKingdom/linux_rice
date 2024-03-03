vim.cmd([[
   " Detect latex files properly
   autocmd BufRead,BufNewFile *.tex set filetype=tex
]])

vim.cmd([[
   " Compile latex file on file write
   autocmd BufWritePost *.tex silent! !lualatex --output-directory='~/.local/share/latex/output' %
]])

vim.cmd([[
   " Center page on transition to insert mode
   autocmd InsertEnter * norm zz
]])

vim.cmd([[
   " Clear trailing whitespace on save
   autocmd BufWritePre * %s/\s\+$//e
]])

vim.cmd([[
   autocmd Filetype c,css setlocal iskeyword-=-
   autocmd FileType c setlocal iskeyword-=_
]])
