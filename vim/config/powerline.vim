"====[ Powerline ]====
"source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
let powerlinepath = "/Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim"
if filereadable(powerlinepath) 
  source /Library/Python/2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
endif

" Always show statusline
set laststatus=2

let g:Powerline_symbols = "fancy"
