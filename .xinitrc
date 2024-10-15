#!/bin/sh

# Clear /tmp (caution: you probably don't want this unless you know what you're doing)
/bin/rm -rf /tmp/* /tmp/.* > /dev/null

# Start GPG-agent (used by pam-gnupg)
/usr/bin/gpg-agent --daemon

# Start D-Bus message bus daemon
dbus-daemon --session --nofork --nopidfile --address="unix:path=$XDG_RUNTIME_DIR/bus" &

# Load .Xresources
[ -f "$XDG_CONFIG_HOME/xresources" ] && xrdb -load "$XDG_CONFIG_HOME/xresources"

# Set a random wallpaper
#
# wal: Written in Python. Sets the system color scheme based on the primary colors
#      of the selected background image.
#
# feh: Written in C. Primarily an image viewer, but has support for displaying
#      images in the background which is equivallent to setting a wallpaper.
feh -z "$HOME/pics/bkgnds" --bg-fill --no-fehbg &
# wal -i "$HOME/pics/bkgnds/$(ls $HOME/pics/bkgnds | sort -R | sort -n 1)" &

# Start Picom compositor (primarily manages window transparency)
picom -b

# Sync Real Time Clock (RTC) with NTP server
chronyc trimrtc &

# Enable numlock at boot
numlockx &

# Logitech mouse/keyboard manager
solaar -w hide &

# Set autorepeat delay and the repeat rate for key presses
xset r rate 200 45 &

# Start WirePlumber (session/policy manager for PipeWire)
# NOTE: I start wireplumber from $XDG_CONFIG_HOME so that
# it does not create the persistent storage directory in
# my home folder (VERY annoying).
# (cd "$XDG_CONFIG_HOME"; wireplumber &)

# Start PipeWire media server
# NOTE: I have set up my pipewire.conf to autostart pipewire-pulse.
# Normally, you'd have to start pipewire-pulse after pipewire.
# /usr/bin/pipewire &

pulseaudio &

# Start Music Player Daemon (used by ncmpcpp)
mpd &

# Start dunst notification daemon
dunst &

# Open a browser session
eval "$BROWSER" &

# Send a welcome notification
notify-send "Welcome $USER 😎"

# Start taskbar
exec dwmblocks &

# Start DWM (MUST be last command)
exec dwm
