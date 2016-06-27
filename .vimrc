colorscheme wuye

if has('persistent_undo')
  set undodir=~/.vim/.vimundo
  set undofile
endif

set number
set nobackup
set expandtab
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set ignorecase
set list
set listchars=tab:\ \ ,trail:･,eol:↲
set hlsearch
set backspace=start,eol,indent
set t_ut=
set t_Co=256
set cursorline
set clipboard+=unnamed
set wildmode=list:longest,full
set nosmartcase
set wildignorecase
set noeb vb t_vb=
set cmdheight=1
set laststatus=2
set pumheight=5
set omnifunc=syntaxcomplete#Complete
set lazyredraw

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

let g:netrw_liststyle=3

