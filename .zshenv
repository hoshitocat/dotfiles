if [ -f ~/dotfiles/.zshenvSettings ]; then
  source ~/dotfiles/.zshenvSettings
fi

# If PATH of environmental variables coincides itself when repeated PATH is removed.
typeset -U path PATH
