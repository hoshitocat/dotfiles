# rbenv
if [ -d ${HOME}/.rbenv ]; then
  export PATH="$HOME/.rbenv/bin:${HOME}/.rbenv/shims:${PATH}"
  eval "$(rbenv init -)"
fi

# Java
export JAVA_HOME='/Library/Internet Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin'
export PATH="${JAVA_HOME}:${PATH}"

# $GOPATH setting
if type go > /dev/null 2>&1; then
  go env -w GOPATH=$HOME/Dev/.gopath/$(go env GOVERSION)
else
  echo "command not found: go: you should install go command"
fi
