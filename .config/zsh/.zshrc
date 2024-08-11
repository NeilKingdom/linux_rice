#!/bin/zsh
#
# Z-Shell Config

# Colors

autoload -Uz colors && colors
WHITE="%{$fg[white]%}"
BLACK="%{$fg[black]%}"
RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
YELLOW="%{$fg[yellow]%}"
BLUE="%{$fg[blue]%}"
MAGENTA="%{$fg[magenta]%}"
CYAN="%{$fg[cyan]%}"

PS1="%B${RED}[${YELLOW}%n${BLUE}@${YELLOW}%M %1d${RED}]${YELLOW}$%{$reset_color%} "

# ZSH history settings

HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$XDG_CACHE_HOME/zsh/history"
setopt hist_ignore_all_dups

# Tab complete

autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# Vim key mappings for tab complete menu

bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# vi mode

bindkey -v
export KEYTIMEOUT=5

# Aliases
source "$XDG_CONFIG_HOME/zsh/aliases"

# Source ZSH syntax highlight plugin (MUST be the last line in the config file)
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
