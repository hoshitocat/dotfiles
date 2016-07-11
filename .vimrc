"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath^=~/.vim/deins/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin(expand('~/.vim/deins'))

" Let dein manage dein
" Required:
call dein#add('Shougo/dein.vim')

" Add or remove your plugins here:
call dein#add('Shougo/unite.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('davidhalter/jedi-vim')
call dein#add('fatih/vim-go')
call dein#add('itchyny/landscape.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('kien/ctrlp.vim')
call dein#add('mxw/vim-jsx')
call dein#add('pangloss/vim-javascript')
call dein#add('slim-template/vim-slim')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-jp/vim-go-extra')

" You can specify revision/branch/tag.
" call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

" Required:
call dein#end()

" Required:
filetype plugin indent on

" If you want to install not installed plugins on startup.
"if dein#check_install()
"  call dein#install()
"endif

"End dein Scripts-------------------------

colorscheme wuye

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
set lazyredraw

nnoremap ; :
nnoremap : ;
vnoremap ; :
vnoremap : ;

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

