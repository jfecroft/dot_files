" Vim jumps to the last position when reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

filetype plugin on

"useful key rebindings
" jk to escape insert mode  
inoremap jk <esc>
" avoid the need to shift
"nnoremap ; :
" backspace behaves normally
set backspace=indent,eol,start

let fortran_free_source=1
syntax on
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
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

" tabbing
filetype plugin indent on
" use vimsleuth instead
"set tabstop=4
"set shiftwidth=4
"set softtabstop=4
"set expandtab

" fix backspace
set backspace=indent,eol,start

"" strip whitespace on save
"autocmd BufWritePre *.py :%s/\s\+$//e
"autocmd BufWritePre *.hs :%s/\s\+$//e
"autocmd BufWritePre *.f :%s/\s\+$//e
"autocmd BufWritePre *.tex :%s/\s\+$//e
"autocmd BufWritePre *.bib :%s/\s\+$//e

autocmd BufRead,BufNewFile *.tex setlocal spell
autocmd BufRead,BufNewFile *.md setlocal spell

" syntax highlight whole file can slow things down
" seems to be needed for latex files especially
autocmd BufEnter * :syntax sync fromstart

" Disable Arrow keys in Escape mode
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

" " Disable Arrow keys in Insert mode
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
