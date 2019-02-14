set nocompatible
set nu
syntax on
set encoding=utf-8
set showcmd
filetype plugin indent on
set tabstop=4 shiftwidth=4
set backspace=indent,eol,start
set autowrite
set hlsearch
set incsearch
set ignorecase
set smartcase

au BufWritePost *.sh  !chmod +x %



