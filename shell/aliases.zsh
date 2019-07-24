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
alias awk=gawk # NOTE: replace GNU awk from OS X awk

function docker_compose_run()
{
  if [ -z "$1" ]; then
    docker-compose help
    echo "  console, c         Execute rails console"
    echo "  bash, shell        Execute /bin/bash"
  else
    if [ "$1" = "console" ] || [ "$1" = "c" ]; then
      docker exec -it $(docker-compose ps -q app) /bin/bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; rails c"
    elif [ "$1" = "bash" ]; then
      docker exec -it $(docker-compose ps -q app) /bin/bash -c "export COLUMNS=`tput cols`; export LINES=`tput lines`; exec bash"
    else
      docker-compose $@
    fi
  fi
}
