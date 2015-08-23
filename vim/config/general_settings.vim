" Vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin on

"useful key rebindings
" jk to escape insert mode  
inoremap jk <esc>
" avoid the need to shift
nnoremap ; :
" backspace behaves normally
set backspace=indent,eol,start

syntax enable
" wildmenu (vim command line completion)
set wildmenu
set wildmode=list:longest

" line numbers
set number
set numberwidth=4
highlight LineNr ctermfg=DarkGrey

" long lines
set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

" tabbing
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

" fix backspace
set backspace=indent,eol,start

" strip whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
