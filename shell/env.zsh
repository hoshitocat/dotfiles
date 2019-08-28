# enable Emacs keybind on zsh & tmux
bindkey -e

export TERM=xterm-256color

# vim version 7.4
export PATH="/usr/local/bin:$PATH"

# MySQL Path Setting
export PATH="/usr/local/mysql/bin:$PATH"

# ls color
export LSCOLORS=gxfxcxdxbxegedabagacad

# $GOPATH setting
if [ -x "`which go`" ]; then
  export GOROOT=`go env GOROOT`
  export GOPATH=$HOME/Developments/go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi

# adb Android Debug Bridge
export PATH="${PATH}:${HOME}/Library/Android/sdk/platform-tools"

# cask
export HOMEBREW_CASK_OPTS="--appdir=/Applications"

# direnv
eval "$(direnv hook zsh)"

# LOCALE
export LC_ALL=en_US.UTF-8
