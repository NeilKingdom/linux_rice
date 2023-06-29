-- Detect latex files properly
vim.cmd "autocmd BufRead,BufNewFile *.tex set filetype=tex"

-- TODO: I don't think that lualatex is recognized as a valid command
-- Compile latex file on file write
vim.cmd "autocmd BufWritePost *.tex silent! !lualatex --output-directory='~/.local/share/latex/output' %"

-- Center page on transition to insert mode
vim.cmd "autocmd InsertEnter * norm zz"

-- Clear trailing whitespace on save
vim.cmd "autocmd BufWritePre * %s/\\s\\+$//e"

vim.cmd "autocmd Filetype c,css setlocal iskeyword-=-"
vim.cmd "autocmd FileType c setlocal iskeyword-=_"
