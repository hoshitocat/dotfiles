"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

" Required:
set runtimepath^=~/.vim/deins/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('~/.vim/deins')
  call dein#begin('~/.vim/deins')

  " Let dein manage dein
  " Required:
  call dein#add('~/.vim/deins/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/vimproc.vim', { 'build' : 'make' })
  call dein#add('Shougo/vimshell.vim')
  call dein#add('airblade/vim-gitgutter')
  call dein#add('danro/rename.vim')
  call dein#add('davidhalter/jedi-vim')
  call dein#add('dracula/vim')
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('fatih/vim-go')
  call dein#add('itchyny/landscape.vim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('kannokanno/previm')
  call dein#add('kchmck/vim-coffee-script')
  call dein#add('kien/ctrlp.vim')
  call dein#add('kristijanhusak/vim-hybrid-material')
  call dein#add('mxw/vim-jsx')
  call dein#add('pangloss/vim-javascript')
  call dein#add('plasticboy/vim-markdown')
  call dein#add('slim-template/vim-slim')
  call dein#add('thinca/vim-qfreplace')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-fugitive')
  call dein#add('tyru/open-browser.vim')
  call dein#add('vim-scripts/Align')
  call dein#add('vim-scripts/SQLUtilities')

  " Required:
  call dein#end()
  call dein#save_state()
endif

"End dein Scripts-------------------------
