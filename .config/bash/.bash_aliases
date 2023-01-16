#!/bin/bash
# Born Again Shell aliases

# Aliases for XDG-compliant config files

alias wget="wget --hsts-file=$XDG_CACHE_HOME/wget-hsts --no-config"
alias mbsync="mbsync -c $XDG_CONFIG_HOME/isync/mbsyncrc --all"
alias neomutt="neomutt -F $XDG_CONFIG_HOME/mutt/muttrc"
alias lf="$XDG_CONFIG_HOME/lf/lfub"

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
alias trc="transmission-remote-cli"
alias mc="minecraft"
alias reboot="sudo reboot"
alias shutdown="sudo shutdown -h now"
alias mount="sudo mount"
alias umount="sudo umount"
alias diff="diff --color --suppress-common-lines -y"
