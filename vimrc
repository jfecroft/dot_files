" taken from https://github.com/wellbredgrapefruit/vim_config
" Use ; for <Leader>. (<Leader> is used to start most non-basic keybindings
" in this configuration; I prefer to use ; for <Leader> since it's right on
" the home row, but change it as you prefer and all the keybindings will be
" updated appropriately.
let mapleader = "\\"

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/syntastic'
Plug 'sjl/gundo.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'ervandew/supertab'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'preservim/nerdcommenter'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

""" Custom Configs include.
" All custom config settings are stored in the .vim/config folder to
" differentiate them from 3rd-party libraries.
runtime! config/**/*
