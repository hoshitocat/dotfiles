let files = [
  \'vundle.vim',
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
colorscheme hybrid_material
