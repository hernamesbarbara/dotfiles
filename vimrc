set nocompatible
set ruler

set number        " shows row and col nums in bottom right 
set tabstop=4 shiftwidth=4 expandtab
set autoindent    " auto indent same num as prev line

syntax on

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


let mapleader=","
nnoremap <leader>ut  :UndotreeToggle<cr>
nnoremap <leader>nt  :NERDTreeToggle<cr>
nnoremap <leader>cy  :Calendar -view=year -split=vertical -width=27<cr>
nnoremap <leader>cm  :Calendar -view=month<cr>
