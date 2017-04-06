set columns=100
set lines=50
set clipboard=unnamed
set nobackup
set imdisable
set linespace=0
set guifont=Ricty\ Regular\ for\ Powerline:h12 " OS X Setting
set guioptions=eg
" e is smart tab bar
" I don't know what g mean...orz
" m is menubar
" T is toolbar
" r and R is right scrollbar
" l and L is left scrollbar
" b is bottom scrollbar
set cursorline

set cmdheight=1 " command line buffer height
set laststatus=2 " status line position
set noeb vb t_vb= " no beep sound
set shell=/usr/local/bin/bash

nnoremap <D-u> :<C-u>call ToggleTransparency()<CR>

function! ToggleTransparency()
  if &transparency == 0
    set transparency=20
  else
    set transparency=0
  endif
endfunction

" colorscheme wuye
" highlight CursorLineNr guifg=yellow
" colorscheme jellybeans_custom
colorscheme hybrid_material
