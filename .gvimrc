set columns=200
set lines=60
set clipboard=unnamed
set nobackup
set imdisable
set linespace=2
set guifont=Monaco:h12 " OS X Setting
set columnspace=1
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
set shell=/usr/local/bin/zsh

nnoremap <D-u> :<C-u>call ToggleTransparency()<CR>

function! ToggleTransparency()
  if &transparency == 0
    set transparency=10
  else
    set transparency=0
  endif
endfunction
colorscheme hybrid_material
