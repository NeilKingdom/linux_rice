-- Detect latex files properly
vim.cmd "autocmd BufRead,BufNewFile *.tex set filetype=tex"

-- Compile latex file on file write
vim.cmd "autocmd BufWritePost *.tex silent! !lualatex --output-directory='~/.local/share/latex/output' %"
