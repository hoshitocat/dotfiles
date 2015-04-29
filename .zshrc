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

alias postgresql-start="pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start"
alias postgresql-stop="pg_ctl -D /usr/local/var/postgres -s -m fast"
alias wireshark="/usr/local/Cellar/wireshark/1.12.1/bin/wireshark-qt"
alias mvim='/Applications/MacVim.app/Contents/MacOS/mvim'
alias ema='open -a /Applications/Emacs.app'
alias emacs='/usr/local/Cellar/emacs/24.4/bin/emacsclient -nw'

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"

# vim sftp://***RemoteHostName***/
function svim() {
  vim sftp://$*/
}

