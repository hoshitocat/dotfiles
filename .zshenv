if [ -f ~/dotfiles/shell/env.zsh ]; then
  source ~/dotfiles/shell/env.zsh
fi

# If PATH of environmental variables coincides itself when repeated PATH is removed.
typeset -U path PATH
