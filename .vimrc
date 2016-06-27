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
call dein#add('kien/ctrlp.vim')
call dein#add('Shougo/unite.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('itchyny/landscape.vim')
call dein#add('itchyny/lightline.vim')

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

" unite.vim
let g:unite_enable_start_insert = 1
let g:unite_enable_split_vertically = 0
" let g:unite_winwidth = 40
nmap <Space> [Unite]
nnoremap [Unite]f :<C-u>UniteWithBufferDir -buffer-name=files file file/new<CR>
nnoremap [Unite]m :<C-u>Unite  file_mru <CR>
nnoremap [Unite]rc :<C-u>Unite file_rec/async:app/controllers/ <CR>
nnoremap [Unite]rfc :<C-u>Unite file file/new -input=app/controllers/ <CR>
nnoremap [Unite]rm :<C-u>Unite file_rec/async:app/models/ <CR>
nnoremap [Unite]rfm :<C-u>Unite file file/new -input=app/models/ <CR>
nnoremap [Unite]rv :<C-u>Unite file_rec/async:app/views/ <CR>
nnoremap [Unite]rfv :<C-u>Unite file file/new -input=app/views/ <CR>
nnoremap [Unite]rs :<C-u>Unite file_rec/async:app/assets/stylesheets/ <CR>
nnoremap [Unite]rfs :<C-u>Unite file file/new -input=app/assets/stylesheets/ <CR>
nnoremap [Unite]rj :<C-u>Unite file_rec/async:app/assets/javascripts/ <CR>
nnoremap [Unite]rfj :<C-u>Unite file file/new -input=app/assets/javascripts/ <CR>
nnoremap [Unite]ro :<C-u>Unite file_rec/async:config/ <CR>
nnoremap [Unite]rfo :<C-u>Unite file file/new -input=config/ <CR>
nnoremap [Unite]rl :<C-u>Unite file_rec/async:lib/ <CR>
nnoremap [Unite]rfl :<C-u>Unite file file/new -input=lib/ <CR>
nnoremap [Unite]rr :<C-u>Unite file_rec/async:spec/ <CR>
nnoremap [Unite]rfr :<C-u>Unite file file/new -input=spec/ <CR>
" search for current directory
nnoremap [Unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" unite grep uses ag(The Silver Searcher)
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor --column'
  let g:unite_source_grep_recursive_opt = ''
endif

" ctrlp.vim
let g:ctrlp_map='<C-,>'
let g:ctrlp_cmd='CtrlP'
let g:ctrlp_working_path_mode='ra'
let g:ctrlp_user_command='find %s -type f'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/.DS_Store,*/.git/**     " MacOSX/Linux
set wildignore+=*\\vendor\\**
" let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](tmp|node_modules|.git|bundle|hg|svn)',
  \ 'file': '\v\.(exe|so|dll|o)$',
  \ }
if exists("g:ctrlp_user_command")
  unlet g:ctrlp_user_command
endif
nnoremap <Leader>f :<C-u>CtrlP<CR>
" reload CtrlP index
nnoremap <Leader>rc :<C-u>CtrlPClearCache<CR>

" gitgutter
let g:gitgutter_realtime = 0
let g:gitgutter_eager = 0

" lightLline.vim
source ~/dotfiles/.vimStatusLine

