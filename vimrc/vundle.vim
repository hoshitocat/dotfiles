set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Plugin '[Github Author]/[Github repo]' の形式で記入
Plugin 'Shougo/neomru.vim'
Plugin 'Shougo/unite.vim'
Plugin 'Shougo/vimproc.vim', { 'build' : 'make' }
Plugin 'Shougo/vimshell.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'danro/rename.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'dracula/vim'
Plugin 'elixir-lang/vim-elixir'
Plugin 'fatih/vim-go'
Plugin 'hashivim/vim-terraform'
Plugin 'itchyny/landscape.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'kannokanno/previm'
Plugin 'kchmck/vim-coffee-script'
Plugin 'kien/ctrlp.vim'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'leafgarland/typescript-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'plasticboy/vim-markdown'
Plugin 'slim-template/vim-slim'
Plugin 'thinca/vim-qfreplace'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'tyru/open-browser.vim'
Plugin 'vim-scripts/Align'
Plugin 'vim-scripts/SQLUtilities'

call vundle#end()
filetype plugin indent on
