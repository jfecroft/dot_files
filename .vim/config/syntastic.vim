" use fancy symbols for errors and warnings
let g:syntastic_error_symbol='✗'
let g:syntastic_warning_symbol='⚠'
let g:syntastic_python_checkers = ['pycodestyle', 'pylint']
let g:syntastic_text_checkers = ['proselint']
let g:syntastic_tex_checkers = ['lacheck', 'chktex', 'proselint']
let g:syntastic_aggregate_errors = 1

let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
