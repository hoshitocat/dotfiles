alias ls='ls -GF'
alias rm='rm -i'
alias mv='mv -i'
alias cp='cp -i'
alias grep='grep --color -n'
alias ag='ag --hidden -i'
alias dc="docker-compose"

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
