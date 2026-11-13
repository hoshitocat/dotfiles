function peco-cdr() {
  local selected_dir=$(cdr -l | sed -E 's/^[0-9]+ +//' | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N peco-cdr
# Option(⌥)+2 : ⌥ を Alt として扱う設定が必要 (ghostty/config.ghostty の macos-option-as-alt)
bindkey '^[2' peco-cdr
# Ctrl+2 (= Ctrl+Space, NUL) も従来どおり残す
bindkey '^@' peco-cdr
