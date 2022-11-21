set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'Shougo/vimshell.vim'

Plugin 'airblade/vim-gitgutter'
Plugin 'chazmcgarvey/vim-mermaid'
Plugin 'danro/rename.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'delphinus/vim-firestore'
Plugin 'dracula/vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'itchyny/landscape.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'jparise/vim-graphql'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'previm/previm'
Plugin 'slim-template/vim-slim'
Plugin 'thinca/vim-qfreplace'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tyru/open-browser.vim'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'

call vundle#end()
filetype plugin indent on

" make vimproc for macos
let b:vimproc = "~/.vim/bundle/vimproc.vim/"
if isdirectory(expand(b:vimproc))
  if empty(glob(b:vimproc.'lib/vimproc_mac.so'))
    call system('cd '.b:vimproc.' && make')
  endif
endif
