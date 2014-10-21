if filereadable(expand("~/dotfiles/.vimEncoding"))
  source ~/dotfiles/.vimEncoding
endif

if filereadable(expand("~/dotfiles/.vimNeoBundle"))
  source ~/dotfiles/.vimNeoBundle
endif

if filereadable(expand("~/dotfiles/.vimBasedSettings"))
  source ~/dotfiles/.vimBasedSettings
endif

set formatoptions-=ro
autocmd FileType * set formatoptions-=ro