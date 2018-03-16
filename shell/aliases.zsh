alias ls='ls -G'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color -n'
alias ag='ag --hidden -i'
alias updatedb='sudo /usr/libexec/locate.updatedb'
alias ctags="`brew --prefix`/bin/ctags"
alias rtags='ctags --langmap=RUBY:.rb --exclude="*.js" --exclude=".git*" -R .'
alias vim='LANG=en_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
alias gvim='vim -g'
alias vi="vim"
alias drails=docker_rails

function docker_rails()
{
  if [ -z "$1" ]; then
    echo "console: execute rails console in container"
    echo "bash: execute /bin/bash in docker container"
  else
    if [ "$1" = "console" ]; then
      docker exec -it $(docker-compose ps -q app) /bin/bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; rails c"
    elif [ "$1" = "bash" ]; then
      docker exec -it $(docker-compose ps -q app) /bin/bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; exec bash"
    else
      echo "console: execute rails console in container"
      echo "bash: execute /bin/bash in docker container"
    fi
  fi
}
