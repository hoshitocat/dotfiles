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
call dein#add('Shougo/vimshell.vim')
call dein#add('airblade/vim-gitgutter')
call dein#add('davidhalter/jedi-vim')
call dein#add('dracula/vim')
call dein#add('fatih/vim-go')
call dein#add('itchyny/landscape.vim')
call dein#add('itchyny/lightline.vim')
call dein#add('kchmck/vim-coffee-script')
call dein#add('kien/ctrlp.vim')
call dein#add('mxw/vim-jsx')
call dein#add('pangloss/vim-javascript')
call dein#add('scrooloose/syntastic')
call dein#add('slim-template/vim-slim')
call dein#add('suan/vim-instant-markdown') " need to run `$ npm -g install instant-markdown-d`
call dein#add('thinca/vim-qfreplace')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-fugitive')
call dein#add('vim-scripts/WuYe')

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
