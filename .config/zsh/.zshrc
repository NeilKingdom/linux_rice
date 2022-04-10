# Z-Shell Config

autoload -U colors && colors
PS1="%B%{$fg[magenta]%}[%{$fg[cyan]%}%n%{$fg[blue]%}@%{$fg[cyan]%M %1d%{$fg[magenta]%}]%{$fg[cyan]%}$%{$reset_color%} "

# History settings
HISTSIZE=
SAVEHIST=
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a; history -r"
HISTFILE="$HOME/.cache/zsh/history"

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

# XDG environment variables
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/down"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_STATE_HOME=
export XDG_DESKTOP_DIR=
export XDG_VIDEOS_DIR=

# XDG compliant application env vars
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export MPLAYER_HOME="$XDG_DATA_HOME/mplayer"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export SSB_HOME="$XDG_DATA_HOME/zoom"

# Fixes graphical issues with IDEA software
export _JAVA_AWT_WM_NONREPARENTING=1
# For personal developement use
export DEVEL_DIR="$HOME/devel/github"
GPG_TTY=$(tty)
export GPG_TTY

#### Aliases ####

# Aliases for XDG compliant config files
alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts --config=$XDG_CONFIG_HOME/wgetrc"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"
alias code='vscodium --extensions-dir "$XDG_DATA_HOME/vscode"'

# Abbreviations
alias cddev="cd $DEVEL_DIR"
alias paint="mtpaint"
alias scli="scli -s -n -f --color=high"
alias scim="sc-im"
alias ap="absolutely-proprietary -f"
alias rstudio="rstudio-bin"
alias ls="ls --color"
alias za="zathura"
alias tc="transmission-cli"
alias lf="$XDG_CONFIG_HOME/lf/lfub"
alias nvim="neovim"
alias neomutt="neomutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias mc="minecraft-launcher"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias mount="sudo mount"
alias umount="sudo umount"

# Source zsh syntax highlight plugin. Should be last
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
