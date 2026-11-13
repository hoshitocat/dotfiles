setopt hist_ignore_all_dups
setopt EXTENDED_HISTORY

if [ -f ~/dotfiles/shell/config.zsh ]; then
  source ~/dotfiles/shell/config.zsh
fi

if [ -d ~/dotfiles/peco-sources ]; then
  for f (~/dotfiles/peco-sources/* ) source "${f}"
fi

if [ -f ~/dotfiles/shell/aliases.zsh ]; then
  source ~/dotfiles/shell/aliases.zsh
fi

if [ -f ~/dotfiles/shell/gcloud.zsh ]; then
  source ~/dotfiles/shell/gcloud.zsh
fi

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# direnv
(( $+commands[direnv] )) && eval "$(direnv hook zsh)"
export PATH="$HOME/.local/bin:$PATH"

# Run a command with MCP credentials injected by 1Password.
with-mcp-env() {
  local mcp_env_file="$HOME/.config/mcp.env"

  if [[ ! -r "$mcp_env_file" ]]; then
    echo "MCP env file is not readable: $mcp_env_file" >&2
    return 1
  fi

  op run \
    --no-masking \
    --env-file="$mcp_env_file" \
    -- "$@"
}

# Claude CLI; endpoint/model settings belong in ~/.zshrc.local.
cc() {
  with-mcp-env claude "$@"
}

# Default editor
export EDITOR="nvim"
export VISUAL="nvim"

# MCP pat
codex-mcp() {
  local -a herdr_config=()
  if [[ "${HERDR_ENV:-}" == "1" ]]; then
    local herdr_name herdr_value
    for herdr_name in HERDR_ENV HERDR_WORKSPACE_ID HERDR_TAB_ID HERDR_PANE_ID; do
      herdr_value="${(P)herdr_name}"
      if [[ -n "$herdr_value" ]]; then
        herdr_config+=(-c "shell_environment_policy.set.${herdr_name}='${herdr_value}'")
      fi
    done
  fi
  with-mcp-env codex --no-daemon "${herdr_config[@]}" "$@"
}

alias cx='codex-mcp'

# Device-local credentials/configuration (not included in the archive).
if [[ -r "$HOME/.zshrc.local" ]]; then
  source "$HOME/.zshrc.local"
fi
