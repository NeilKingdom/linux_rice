" PATH VARIABLES

set runtimepath^=$XDG_CONFIG_HOME/nvim
set packpath^=$XDG_CONFIG_HOME/nvim/plugged
"set viminfo=%,<800,'10,/50,:100,h,f0,n~/.config/vim/viminfo

" CONFIG START

syntax on
let mapleader=" "

" PLUGGINS

"source $XDG_CONFIG_HOME/vim/cscope.vim

call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-telescope/telescope.nvim'
Plug 'vim-airline/vim-airline'
"Plug 'altercation/vim-colors-solarized'
call plug#end()

" SETS

set encoding=utf-8
set splitbelow splitright
set number relativenumber
set smartindent
set expandtab
set tabstop=3
set softtabstop=3
set shiftwidth=3
set scrolloff=8
set smartcase
set nohlsearch
set incsearch
set noswapfile
set nobackup
set undodir=~/.config/nvim/undodir
set undofile
set wildmode=longest,list,full

" MAPPINGS

nnoremap <leader>c :set signcolumn=yes <CR>
nnoremap <leader>C :set signcolumn=no <CR>
nnoremap <leader>s :!clear && shellcheck %<CR>
nnoremap <leader>so :so %<CR>
nnoremap <leader>ps :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <Up> 5<C-w><S-+>
nnoremap <Down> 5<C-w><S-->
nnoremap <Left> 10<C-w><S->>
nnoremap <Right> 10<C-w><S-<>

" AUTO COMMANDS

" Detect latex files properly
autocmd BufRead,BufNewFile *.tex set filetype=tex

" Set spellcheck on for tex, latex, markdown
autocmd FileType tex,latex,markdown setlocal spell! spelllang=en_us

" Center page on transition to insert mode
autocmd InsertEnter * norm zz

" Clear trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e
