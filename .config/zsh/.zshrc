# Z-Shell Config

# Colors
autoload -U colors && colors
RED="%{$fg[red]%}"
GREEN="%{$fg[green]%}"
YELLOW="%{$fg[yellow]%}"
BLUE="%{$fg[blue]%}"
MAGENTA="%{$fg[magenta]%}"
CYAN="%{$fg[cyan]%}"

PS1="%B${RED}[${YELLOW}%n${BLUE}@${YELLOW}%M %1d${RED}]${YELLOW}$%{$reset_color%} "

# History settings
HISTSIZE=5000
SAVEHIST=5000
HISTFILE="$XDG_CACHE_HOME"/zsh/history
setopt hist_ignore_all_dups

# Tab complete
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
_comp_options+=(globdots) # Include hidden files

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

#### Env Vars ####

# Personal environment variables
export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
export DEBUGINFOD_URLS="https://debuginfod.elfutils.org/"

# XDG environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/down"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_DESKTOP_DIR="$HOME"
export XDG_STATE_HOME=
export XDG_VIDEOS_DIR=

# XDG compliant application env vars
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export MPLAYER_HOME="$XDG_CONFIG_HOME/mplayer"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export SSB_HOME="$XDG_DATA_HOME/zoom"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export CARGO_HOME="$XDG_DATA_HOME"/cargo

# Used by all applications that rely on dbus
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
# Disable C# telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# Fixes GUI applications written in Java
export _JAVA_AWT_WM_NONREPARENTING=1
# For personal developement use
export DEVEL_DIR="$HOME/devel/github"
# GNU Privacy Guard
GPG_TTY=$(tty)
export GPG_TTY

#### Aliases ####

# Aliases for XDG compliant config files
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts --no-config"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc --all"

# Abbreviations
alias cddev="cd $DEVEL_DIR"
alias grep="grep --color"
alias scli="scli -nfs --color=high"
alias scim="sc-im"
alias ap="absolutely-proprietary -f"
alias rstudio="rstudio-bin --no-sandbox"
alias nvim="nvim -i $XDG_CACHE_HOME/nvim/shada/main.shada"
alias history="history 1"
alias ls="ls --color"
alias za="zathura"
alias tri="transmission-remote-cli"
alias lf="$XDG_CONFIG_HOME/lf/lfub"
alias neomutt="neomutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias mc="minecraft-launcher"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias mount="sudo mount"
alias umount="sudo umount"
alias fritzing="Fritzing"
alias diff="diff --color --suppress-common-lines -y"

# Source zsh syntax highlight plugin. Should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2> /dev/null
