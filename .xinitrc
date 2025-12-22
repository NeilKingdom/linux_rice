#!/bin/sh

# Clear /tmp (caution: you probably don't want this unless you know what you're doing)
/bin/rm -rf /tmp/* /tmp/.* > /dev/null

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
feh -z "$HOME/images/bkgnds" --bg-fill --no-fehbg &
#wal -i "$(shuf -e $(ls -d $HOME/images/bkgnds/*) | sed 1q)" &

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

# Pulse works better than pipewire for my setup
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
