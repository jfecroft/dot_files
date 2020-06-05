" Options
"let g:ctrlp_map = '<Leader>f' " use <Leader>f to open the ctrlp window

set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*/.git/*,*/.hg/*,*/.svn/*

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll|pyc)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

let g:ctrlp_cmd = 'CtrlPMRUFiles'
