# Created by newuser for 4.3.17

# zshの補完機能
autoload -U compinit
compinit

# zshのプロンプト設定
autoload colors
colors

setopt PROMPT_SUBST
setopt TRANSIENT_RPROMPT

# 左プロンプトの設定
# local firstPLine="%F{202}%n%f %F{255}at%f %F{178}%m%f %F{255}in%f %F{106}%~%f"
local firstPLine="%F{008}%~%f"
local NEWLINE=$'\n'
local secondPLine="$ "

# VCS(Version Control Systems)の情報を取得するzshの便利関数 vcs_infoを使う
autoload -Uz vcs_info
# 表示フォーマットの指定
# %b ブランチ情報
# %a アクション名(mergeなど)
# %c ステージング済みが存在するとき表示
# %u アンステージングが存在するとき表示
setopt prompt_subst
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' unstagedstr "%F{226}* %f"
zstyle ':vcs_info:git:*' stagedstr "%F{039}+ %f"
zstyle ':vcs_info:*' formats " [%u%c%F{045}%b%f]"
zstyle ':vcs_info:*' actionformats '%F{045}%b%f%F{255}|%f%F{009}%a%f'

# 右プロンプトの設定
# local firstRPLine="[%D{%y/%m/%d %T}]"

precmd () {
  vcs_info
  PROMPT="${firstPLine}${vcs_info_msg_0_}${NEWLINE}${secondPLine}"
}

# cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
zstyle ':chpwd:*' recent-dirs-max 5000
zstyle ':chpwd:*' recent-dirs-default yes
zstyle ':completion:*' recent-dirs-insert both

# LANG設定
export LANG=en_US.UTF-8
# history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# zsh doesn't classify uppercase and lowercase.
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# 補完時のハイライトとか十字キーで選択移動できる
autoload -U compinit
compinit
zstyle ':completion:*:default' menu select=1
