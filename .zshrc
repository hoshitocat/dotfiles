setopt hist_ignore_all_dups
setopt EXTENDED_HISTORY

if [ -f ~/dotfiles/.zshBasedSettings ]; then
  source ~/dotfiles/.zshBasedSettings
fi

if [ -d ~/dotfiles/peco-sources ]; then
  for f (~/dotfiles/peco-sources/* ) source "${f}"
fi

alias mysql-server="/usr/local/bin/mysql.server"

