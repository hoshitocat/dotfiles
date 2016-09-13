syntax on
filetype on
filetype indent on
filetype plugin on

source ~/dotfiles/vimrc/deins.vim

if has('persistent_undo')
  set undodir=~/.vim/.vimundo
  set undofile
endif

set encoding=utf-8
set termencoding=utf-8
set fileencoding=utf-8
set number
set nobackup
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2
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
" set lazyredraw

highlight CursorLine cterm=underline
highlight CursorLineNr cterm=underline ctermfg=yellow

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

colorscheme wuye
" colorscheme jellybeans_custom

let g:netrw_liststyle=3
let mapleader=','

" unite.vim
source ~/dotfiles/vimrc/unite.vim
" ctrlp.vim
source ~/dotfiles/vimrc/ctrlp.vim
" gitgutter
source ~/dotfiles/vimrc/vim-gitgutter.vim
" lightline.vim
source ~/dotfiles/vimrc/lightline.vim
" jedi for python
source ~/dotfiles/vimrc/jedi-vim.vim
" vim-go
source ~/dotfiles/vimrc/vim-go.vim
" syntastic
source ~/dotfiles/vimrc/syntastic.vim
