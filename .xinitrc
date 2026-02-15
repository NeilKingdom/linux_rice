#!/bin/sh

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

# Logitech device manager
solaar -w hide &

# Set autorepeat delay and the repeat rate for key presses
xset r rate 200 45 &

# NOTE: I'm using pipewire instead of pulseaudio. The ONLY way I could get this
# to work in Artix was to add the following two lines in my pipewire.conf
# (inside the context.exec block):
#
# { path = "/usr/bin/wireplumber"  args = "" }
# { path = "/usr/bin/pipewire-pulse" args = "" }
/usr/bin/pipewire &
#pulseaudio &

# Start Music Player Daemon (used by ncmpcpp)
mpd &

# Start dunst notification daemon
dunst &

# Start taskbar
dwmblocks &

# Launch browser
! [ -z "$BROWSER" ] && sh -c "$BROWSER" &

# Start DWM (MUST be last command)
exec dwm
