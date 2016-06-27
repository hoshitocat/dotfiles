setopt hist_ignore_all_dups
setopt EXTENDED_HISTORY

if [ -f ~/dotfiles/.zshBasedSettings ]; then
  source ~/dotfiles/.zshBasedSettings
fi

if [ -d ~/dotfiles/peco-sources ]; then
  for f (~/dotfiles/peco-sources/* ) source "${f}"
fi

if [ -f ~/dotfiles/.zshAliases ]; then
  source ~/dotfiles/.zshAliases
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# vim sftp://***RemoteHostName***/
function svim() {
  vim sftp://$*/
}

# rbenv
if [ -d ${HOME}/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
  eval "$(rbenv init -)"
fi

# pyenv
if [ -d ${HOME}/.pyenv ]; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
  eval "$(pyenv virtualenv-init -)"
fi
