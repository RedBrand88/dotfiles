#!/usr/bin/env bash
set -e

if command -v brew >/dev/null; then
  brew install stow git neovim starship fzf ripgrep ghostty
elif command -v pacman >/dev/null; then
  sudo pacman -Sy --needed stow git neovim starship fzf ripgrep ghostty
fi

cd ~/dotfiles
stow -t ~ zsh nvim starship ghostty git
echo "dotfiles installed ✅"
