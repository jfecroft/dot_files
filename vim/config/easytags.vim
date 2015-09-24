"====[ Easy tags ]====
let g:easytags_async = 1
"Let Vim walk up directory hierarchy from CWD to root looking for tags file
set tags=tags;/
" Tell EasyTags to use the tags file found by Vim
let g:easytags_dynamic_files = 1
let g:easytags_events = ['BufWritePost']
" Disable automatic highlighting
let b:easytags_auto_highlight = 0
