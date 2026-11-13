#!/bin/bash
set -eu

BASEDIR="$(cd "$(dirname "$0")" && pwd)"
case "$(uname -s)" in
  Darwin) platform=darwin ;;
  Linux) platform=linux ;;
  *) echo "Unsupported platform" >&2; exit 1 ;;
esac

target="$BASEDIR/$platform.gitconfig"
link="$BASEDIR/config"
if [ ! -L "$link" ] || [ "$(readlink "$link")" != "$target" ]; then
  if [ -e "$link" ] || [ -L "$link" ]; then
    backup="$(mktemp "$link.backup.XXXXXX")"
    mv "$link" "$backup"
  fi
  ln -s "$target" "$link"
fi

# Preserve existing global settings, including identity and signing configuration.
include="$BASEDIR/.gitconfig"
if ! git config --global --get-all include.path | grep -Fxq "$include"; then
  git config --global --add include.path "$include"
fi
