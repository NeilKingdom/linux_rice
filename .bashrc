#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Activate vi mode with <Escape>:
set -o vi

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

# alias ls='ls --color=auto'
PS1="${MAGENTA}[${CYAN}\u${BLUE}@${CYAN}\h \W${MAGENTA}]${CYAN}\$${RESET} "

HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a; history -r"

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
export XDG_STATE_HOME=""
export XDG_DESKTOP_DIR=""
export XDG_VIDEOS_DIR=""

# XDG compliant application config file locations
export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export NOTMUCH_CONFIG="$XDG_CONFIG_HOME/notmuch-config"
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export WGETRC="$XDG_CONFIG_HOME/wgetrc"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export MPLAYER_HOME="$XDG_DATA_HOME/mplayer"
export _JAVA_OPTIONS="-Djava.util.prefs.userRoot=$XDG_CONFIG_HOME/java"
export SSB_HOME="$XDG_DATA_HOME/zoom"

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts --config=$XDG_CONFIG_HOME/wgetrc" 
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc"
alias code='vscodium --extensions-dir "$XDG_DATA_HOME/vscode"'

# Aliases for personal use
alias cddev="cd $HOME/devel/school/2022_Fall"
alias paint="mtpaint"
alias scli="scli -s -n -f --color=high"
alias scim="sc-im"
alias ap="absolutely-proprietary -f"
alias rstudio="rstudio-bin"
alias za="zathura"
alias tc="transmission-cli"
alias lf="$XDG_CONFIG_HOME/lf/lfub"
alias nvim="neovim"
alias neomutt="neomutt -F $XDG_CONFIG_HOME/mutt/muttrc"
#alias steam="steam -tenfoot"
alias mc="minecraft-launcher"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias mount="sudo mount"
alias umount="sudo umount"

# Other
# Fixes graphical issues with IDEA software
export _JAVA_AWT_WM_NONREPARENTING=1
# For personal developement use
export DEVEL_DIR="$HOME/devel/github"

GPG_TTY=$(tty)
export GPG_TTY
