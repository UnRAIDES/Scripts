set number
set mouse=a
set numberwidth=1
set clipboard=unnamed
syntax enable
set showcmd
set ruler
set encoding=utf-8
set showmatch
set sw=2
set relativenumber
set laststatus=2
set noshowmode
"Themes and Plugins
packloadall
"----------------
colorscheme dracula
"----------------
let NERDTreeQuitOnOpen=1
let mapleader=" "

nmap <Leader>s <Plug>(easymotion-s2)
nmap <Leader>nt :Vexplore<CR>

nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
