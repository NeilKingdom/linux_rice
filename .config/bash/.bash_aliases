#!/bin/bash

# Aliases for XDG-compliant config files

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts --no-config"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc --all"
alias neomutt="neomutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias lf="$XDG_CONFIG_HOME/lf/lfub"

# Abbreviations

alias cdd="cd $DEVEL_DIR"
alias cds="cd $SCRIPT_DIR"
alias scim="sc-im"
alias ap="absolutely-proprietary -f"
alias za="zathura"
alias mc="minecraft"
alias py="python3"

# Overrides

alias sudo="doas"
alias diff="diff --color --suppress-common-lines -y"
alias shutdown="doas /usr/bin/shutdown -h now"
alias reboot="doas /usr/bin/reboot"
alias mount="doas /usr/bin/mount"
alias umount="doas /usr/bin/umount"
alias history="history 1"
alias ls="ls --color"
alias grep="grep --color"
alias scli="scli -nfs --color=high"
alias lualatex="lltex"
alias vim="export VIMINIT='source ~/.config/vim/vimrc' && vim"
alias nvim="unset VIMINIT && nvim"
