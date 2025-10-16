syntax on
let mapleader = " "
let g:netrw_banner = 0
set path+=**
set nu
set relativenumber
set softtabstop=4
set sw=4
set smarttab
set expandtab
set autoindent
set smartindent
set scrolloff=10
set noswapfile
set nohlsearch
set grepprg=rg\ -S\ --hidden\ --vimgrep
set grepformat=%f:%l:%c:%m

nnoremap <leader>sf :find 
nnoremap <leader>sg :grep
nnoremap <leader>sb :b
nnoremap b] :bn<CR>
nnoremap b[ :bp<CR>
nnoremap c] :cn<CR>
nnoremap c[ :cp<CR>
nnoremap cx :ccl<CR>
nnoremap co :copen<CR>
nnoremap - :E<CR>
