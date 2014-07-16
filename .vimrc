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
set listchars=trail:･
set title "indicate a title
set hlsearch "highlight the search result characters
set visualbell " no beep sound
set backspace=start,eol,indent

" \cで行の先頭にコメントをつけたり外したりできる$
nmap <Leader>c <Plug>(caw:i:toggle)$
vmap <Leader>c <Plug>(caw:i:toggle)$

set formatoptions-=ro
autocmd FileType * set formatoptions-=ro
" コメントアウト改行後に改行さきの行も自動的にコメントアウトされるオプションを解除$

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
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'Shougo/neosnippet.vim'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimshell'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'tyru/caw.vim'
NeoBundle 'tpope/vim-surround' 
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
    \ 'windows' : 'make -f make_mingw32.mak',
    \ 'cygwin' : 'make -f make_cygwin.mak',
    \ 'mac' : 'make -f make_mac.mak',
    \ 'unix' : 'make -f make_unix.mak',
  \ },
\ }
NeoBundle 'aharisu/vim_goshrepl' "LiSP系
NeoBundle 'aharisu/vim-gdev' "LiSP系

" if_luaが有効ならneocompleteを使う
NeoBundle has('lua') ? 'Shougo/neocomplete' : 'Shougo/neocomplcache'

"" ============================neocomplete===============================
let g:neocomplete#force_overwrite_completefunc = 1
if neobundle#is_installed('neocomplete')
  " neocomplete用設定
  let g:neocomplete#enable_at_startup = 1
  let g:neocomplete#enable_ignore_case = 1
  let g:neocomplete#enable_smart_case = 1
  if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
  endif
  let g:neocomplete#keyword_patterns._ = '\h\w*'
elseif neobundle#is_installed('neocomplcache')
  " neocomplcache用設定
  let g:neocomplcache_enable_at_startup = 1
  let g:neocomplcache_enable_ignore_case = 1
  let g:neocomplcache_enable_smart_case = 1
  if !exists('g:neocomplcache_keyword_patterns')
    let g:neocomplcache_keyword_patterns = {}
  endif
  let g:neocomplcache_keyword_patterns._ = '\h\w*'
  let g:neocomplcache_enable_camel_case_completion = 1
  let g:neocomplcache_enable_underbar_completion = 1
endif
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<S-TAB>"
"" ============================neocomplete===============================

"LiSP系の設定
let g:neocomplete#keyword_patterns['gosh-repl'] = "[[:alpha:]+*/@$_=.!?-][[:alnum:]+*/@$_:=.!?-]*"

" =======================previmの設定=========================
autocmd BufNewFile,BufRead *.{md,txt,mdwn,mkd,mkdn,mark*} set filetype=markdown

" let g:previm_open_cmd = ''
" nnoremap [previm] <Nop>
" nmap <Space>p [previm]
" nnoremap <silent> [previm]o :<C-u>PrevimOpen<CR>
" nnoremap <silent> [previm]r :call previm#refresh()<CR>
" =======================previmの設定=========================


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
