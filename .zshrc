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

local firstPLine="%F{3}[%~]%f%"'F{1}$(__git_ps1 "[%s]")%f'$'\n'
local secondPLine="%F{white}%n%f@%F{white}%m%f %% "

local firstRPLine="[%D{%y/%m/%d %T}]"

precmd () {
  PROMPT="$firstPLine$secondPLine"
  RPROMPT="$firstRPLine"
}
GIT_PS1_SHOWDIRTYSTATE=1
GIT_PS1_SHOWUPSTREAM="auto"
GIT_PS1_SHOWCOLORHINTS=1

# LANG設定
export LANG=en_US.UTF-8

# lsで表示されるカラーを変更
alias ls="ls -G"

# rm関係の設定
alias rm="rm -i"

# viコマンドでもvimが起動する
alias vi="vim"

# rbenv versions

