syntax on
filetype on
filetype indent on
filetype plugin on

if has('persistent_undo')
  set undodir=~/.vim/undo_history
  set undofile
endif

set backspace=start,eol,indent
set clipboard+=unnamed
set cmdheight=1
set cursorline
set encoding=utf-8
set expandtab
set fileencoding=utf-8
set hlsearch
set ignorecase
set laststatus=2
set lazyredraw
set list
set listchars=tab:\ \ ,trail:･,eol:↲
set nobackup
set noeb vb t_vb=
set nosmartcase
set number
set omnifunc=syntaxcomplete#Complete
set pumheight=5
set shiftwidth=2
set smartindent
set softtabstop=2
set synmaxcol=180
set t_Co=256
set t_ut=
set tabstop=2
set termencoding=utf-8
set wildignorecase
set wildmode=list:longest,full

" disabled auto insert commend
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

let g:netrw_liststyle=3
let mapleader=','

" teminal shortcut
nnoremap \t :<C-u>terminal ++curwin<cr>
