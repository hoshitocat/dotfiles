if [[ -r "$HOME/dotfiles/shell/env.zsh" ]]; then
  source "$HOME/dotfiles/shell/env.zsh"
fi
typeset -U path PATH
if [[ -r "$HOME/.zshenv.local" ]]; then
  source "$HOME/.zshenv.local"
fi
