#!/bin/bash
#
# Bash config

# Colors

BLACK="\[$(tput setaf 0)\]"
RED="\[$(tput setaf 1)\]"
GREEN="\[$(tput setaf 2)\]"
YELLOW="\[$(tput setaf 3)\]"
BLUE="\[$(tput setaf 4)\]"
MAGENTA="\[$(tput setaf 5)\]"
CYAN="\[$(tput setaf 6)\]"
WHITE="\[$(tput setaf 7)\]"
RESET="\[$(tput sgr0)\]"

PS1="${RED}[${YELLOW}\u${BLUE}@${YELLOW}\h \W${RED}]${YELLOW}\$${RESET} "

# Bash history settings

HISTFILE="$XDG_CONFIG_HOME/bash/.bash_history"
HISTSIZE=5000
HISTFILESIZE=5000
HISTCONTROL=ignoreboth:erasedups
PROMPT_COMMAND="history -a; history -r"

# vi mode
set -o vi

# Personal environment variables

export EDITOR="nvim"
export TERMINAL="st"
export BROWSER="firefox"
# Used by GDB
export DEBUGINFOD_URLS="https://debuginfod.artixlinux.org"
# Personal development directory
export DEVEL_DIR="$HOME/devel/projects"
# Personal scripts directory
export SCRIPT_DIR="$HOME/devel/scripts"

# XDG environment variables

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_DOCUMENTS_DIR="$HOME/docs"
export XDG_DOWNLOAD_DIR="$HOME/down"
export XDG_MUSIC_DIR="$HOME/music"
export XDG_PICTURES_DIR="$HOME/pics"
export XDG_DESKTOP_DIR="$HOME"
export XDG_VIDEOS_DIR=

# Alternative XDG-compliant config file locations

export XAUTHORITY="$XDG_RUNTIME_DIR/Xauthority"
export GNUPGHOME="$XDG_DATA_HOME/gnupg"
export GOPATH="$XDG_DATA_HOME/go"
export PASSWORD_STORE_DIR="$XDG_DATA_HOME/pass"
export RUSTUP_HOME="$XDG_DATA_HOME/rustup"
export CARGO_HOME="$XDG_DATA_HOME/cargo"
export R_HOME_USER="$XDG_CONFIG_HOME/R"
export R_PROFILE_USER="$XDG_CONFIG_HOME/R/profile"
export R_HISTFILE="$XDG_CONFIG_HOME/R/history"
export R_LIBS_USER="$XDG_DATA_HOME/R/%p-library/%v"
export PYTHONSTARTUP="$XDG_CONFIG_HOME/python/startup.py"
export TEXMFHOME="$XDG_DATA_HOME/texmf"
export TEXMFVAR="$XDG_CACHE_HOME/texlive/texmf-var"
export TEXMFCONFIG="$XDG_CONFIG_HOME/texlive/texmf-config"

# Other

# Set calcurse's default editor as neovim
export CALCURSE_EDITOR="nvim"
# Make pass copy to clipboard for 5 minutes
export PASSWORD_STORE_CLIP_TIME=300
# Used by all applications that rely on dbus
export DBUS_SESSION_BUS_ADDRESS="unix:path=$XDG_RUNTIME_DIR/bus"
# Disable C# telemetry
export DOTNET_CLI_TELEMETRY_OPTOUT=1
# Fixes GUI applications written in Java
export _JAVA_AWT_WM_NONREPARENTING=1
# Android SDK location
export ANDROID_HOME="$HOME/devel/android/sdk"
# GNU Privacy Guard
GPG_TTY=$(tty)
export GPG_TTY
