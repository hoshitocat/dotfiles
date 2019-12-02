function peco-cdr() {
  local selected_dir=$(cdr -l | sed -E 's/^[0-9]+ +//' | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cdr
bindkey '^@' peco-cdr
