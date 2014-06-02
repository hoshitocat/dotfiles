# Created by newuser for 4.3.17

# gitのブランチをプロンプトに表示するための機能を読み込む
source /usr/local/git/contrib/completion/git-prompt.sh

# zshの補完機能
autoload -U compinit
compinit

# zshのプロンプト設定
autoload colors
colors

setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT
precmd () {
  PROMPT='%F{white}%n%f@%F{white}%m%f %F{3}%~%f %% '
  RPROMPT='%F{1}$(__git_ps1 "[%s]")%f[%D{%y/%m/%d %T}]'
}
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# rbenv関連
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# LANG設定
export LANG=en_US.UTF-8

# lsで表示されるカラーを変更
export LSCOLORS=gxfxcxdxbxegedabagacad
alias ls="ls -G"

# MySQL Path Setting
export PATH="/usr/local/mysql/bin:$PATH"

# rm関係の設定
alias rm="rm -i"

# viコマンドでもvimが起動する
alias vi="vim"
