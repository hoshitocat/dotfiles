setopt hist_ignore_all_dups
setopt EXTENDED_HISTORY

if [ -f ~/dotfiles/shell/config.zsh ]; then
  source ~/dotfiles/shell/config.zsh
fi

if [ -d ~/dotfiles/peco-sources ]; then
  for f (~/dotfiles/peco-sources/* ) source "${f}"
fi

if [ -f ~/dotfiles/shell/aliases.zsh ]; then
  source ~/dotfiles/shell/aliases.zsh
fi

# vim sftp://***RemoteHostName***/
function svim() {
  vim sftp://$*/
}

# zshrc_env
if [ -f ~/dotfiles/shell/zshrc_env.zsh ]; then
  source ~/dotfiles/shell/zshrc_env.zsh
fi

