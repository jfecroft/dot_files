" taken from https://github.com/wellbredgrapefruit/vim_config
" Use ; for <Leader>. (<Leader> is used to start most non-basic keybindings
" in this configuration; I prefer to use ; for <Leader> since it's right on
" the home row, but change it as you prefer and all the keybindings will be
" updated appropriately.
let mapleader = "\\"

" Plugins
call plug#begin('~/.vim/plugged')

Plug 'hynek/vim-python-pep8-indent'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-sleuth'
Plug 'scrooloose/syntastic'
Plug 'tpope/vim-pathogen'
Plug 'sjl/gundo.vim'
Plug 'majutsushi/tagbar'
Plug 'Raimondi/delimitMate'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'xolox/vim-misc'
Plug 'ervandew/supertab'
Plug 'justinmk/vim-sneak'
Plug 'kshenoy/vim-signature'
Plug 'maxbrunsfeld/vim-yankstack'
Plug 'editorconfig/editorconfig-vim'
Plug 'sheerun/vim-polyglot'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

""" Custom Configs include.
" All custom config settings are stored in the .vim/config folder to
" differentiate them from 3rd-party libraries.
runtime! config/**/*
