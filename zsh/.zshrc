# ---- Basics / env -----------------------------------------------------------
export EDITOR=nvim
alias zshrc="$EDITOR $HOME/.zshrc"
alias zsh="source $HOME/.zshrc"
alias lsa="ls -a"
alias vim="nvim"
export AIDER_EDITOR=nvim

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Completion
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots)   # Include dotfiles in completion

eval "$(starship init zsh)"

# No bell
unsetopt BEEP

# vi mode
bindkey -v
export KEYTIMEOUT=1
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# ---- Remove conflicting cursor-shape hacks (Ghostty+p10k handle this) ----
# (deleted: zle-keymap-select, zle-line-init, preexec echo -ne '\e[... q' lines)

# fzf keybindings/completion (safe)
if command -v fzf >/dev/null 2>&1; then
  source <(fzf --zsh)
fi

# Edit line in $EDITOR with Ctrl-E
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

# Git aliases
alias gs='git status'
alias ga='git add'
alias gaa='git add .'
alias gcm='git commit -m'
alias gd='git diff'
alias gco='git checkout'
alias gcb='git checkout -b'
alias gb='git branch'
alias gbD='git branch -D'
alias gr='git remote'
alias grb='git rebase -i'
alias gap='git add -p'
alias gl='git log'
alias gpl='git pull'
alias gps='git push'
alias gpu='git push --set-upstream origin'
alias grs='git restore'
alias gst='git stash'
alias gstp='git stash pop'

# Your env vars / SDKs (keep as needed)
export GOOGLE_APPLICATION_CREDENTIALS="/Users/bravo/.config/bread-machine-a72fa-6bbf07870e8b.json"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && . "$NVM_DIR/bash_completion"
export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-17.jdk/Contents/Home

# Google Cloud SDK
[ -f '/Users/bravo/Downloads/google-cloud-sdk/path.zsh.inc' ] && . '/Users/bravo/Downloads/google-cloud-sdk/path.zsh.inc'
[ -f '/Users/bravo/Downloads/google-cloud-sdk/completion.zsh.inc' ] && . '/Users/bravo/Downloads/google-cloud-sdk/completion.zsh.inc'

# ---- Plugins (order matters: autosuggestions, then highlighting last) -------
source /Users/bravo/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/bravo/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Optional: colors available for scripts that need them (doesn't set PS1)
autoload -U colors && colors

# Keep custom env last
[ -f "$HOME/.local/bin/env" ] && . "$HOME/.local/bin/env"

