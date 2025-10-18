#!/usr/bin/env bash
set -e

if command -v brew >/dev/null; then
  brew install stow git neovim starship fzf ripgrep ghostty
elif command -v pacman >/dev/null; then
  sudo pacman -Sy --needed stow git neovim starship fzf ripgrep ghostty
fi

cd ~/dotfiles
# run stow multiple times to make it easy to comment out unwanted packages
stow -t ~ zsh 
# stow -t ~ nvim 
stow -t ~ starship 
stow -t ~ ghostty
echo "dotfiles installed ✅"
