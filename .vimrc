let files = [
  \'deins.vim',
  \'vimrc.vim',
  \'unite.vim',
  \'ctrlp.vim',
  \'vim-gitgutter.vim',
  \'lightline.vim',
  \'jedi-vim.vim',
  \'vim-go.vim',
  \'vim-markdown.vim',
  \'previm.vim'
\]

for file in files
  exec 'source '.$HOME.'/dotfiles/vimrc/'.file
endfor

" colorscheme wuye
" highlight CursorLine cterm=underline
" highlight CursorLineNr cterm=underline ctermfg=yellow
set background=dark
colorscheme jellybeans_custom
