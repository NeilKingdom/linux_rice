#!/bin/bash

# vi mode
set -o vi

RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
RESET="\[$(tput sgr0)\]"

PS1="${MAGENTA}[${CYAN}\u${BLUE}@${CYAN}\h \W${MAGENTA}]${CYAN}\$${RESET} "

HISTSIZE=
HISTFILESIZE=
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a; history -r"

# Personal environment variables

export EDITOR="vim"
export TERMINAL="st"
export BROWSER="firefox"
# Used by GDB
export DEBUGINFOD_URLS="https://debuginfod.elfutils.org/"
# Personal development directory
export DEVEL_DIR="$HOME/devel/github"

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

# Alternative XDG-compliant config file locations

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export VIMINIT='let $MYVIMRC = !has("nvim") ? "$XDG_CONFIG_HOME/vim/vimrc" : "$XDG_CONFIG_HOME/nvim/init.vim" | so $MYVIMRC'
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"

# Other

# Used by all applications that rely on dbus
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
# Disable C# telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# Fixes GUI applications written in Java
export _JAVA_AWT_WM_NONREPARENTING=1
# GNU Privacy Guard
GPG_TTY=$(tty)
export GPG_TTY
