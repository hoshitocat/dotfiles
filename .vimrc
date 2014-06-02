"#########################
"# Basic settings of Vim #
"#########################
set encoding=utf-8 "encoding utf-8
colorscheme jellybeans_custom "setting colorscheme
syntax on

set t_Co=256 "256colors
set number "line number
set expandtab "change to blanks tab character
set tabstop=2 "tab is two blanks
set shiftwidth=2 "auto indent is two blanks
set softtabstop=2 "width for the blanks, the cursor shifts tab 
set autoindent "continue to indent a new line
set smartindent "a new line to increase or decrease the indent
set ignorecase "not case sensitive when searching
set list "visualization spaces and line breaks
set title "indicate a title
set hlsearch "highlight the search result characters
set visualbell " no beep sound

" \cで行の先頭にコメントをつけたり外したりできる$
nmap <Leader>c <Plug>(caw:i:toggle)$
vmap <Leader>c <Plug>(caw:i:toggle)$

set formatoptions-=ro
autocmd FileType * set formatoptions-=ro
" コメントアウト改行後に改行さきの行も自動的にコメントアウトされるオプションを解除$

autocmd BufEnter * if &filetype == "" | setlocal ft=txt | endif
" *.txtのfiletypeをtxtに設定する

"##### to store the cursor position #####
autocmd BufWinLeave ?* silent mkview
autocmd BufWinEnter ?* silent loadview
"########################################

filetype off

if has('vim_starting')
  set nocompatible               " Be iMproved

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'

call neobundle#end()

filetype indent plugin on

" Vim-LaTeXの設定
let tex_flavor='latex'
set grepprg=grep\ -nH\ $*
set shellslash
" Macの場合デフォルトでPDF
let g:Tex_DefaultTargetFormat='pdf'

let g:Tex_CompileRule_dvi='platex --interaction=nonstopmode $*'
let g:Tex_CompileRule_pdf='dvipdfmx $*.dvi'
let g:Tex_FormatDependency_pdf='dvi,pdf'

" PDFはPreview.appで開く
let g:Tex_ViewRule_pdf='open -a Preview.app'
