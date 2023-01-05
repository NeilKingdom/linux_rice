#!/bin/sh

# Clear /tmp (caution: you probably don't want this unless you know what you're doing)
/bin/rm -rf /tmp/* /tmp/.* > /dev/null

# Start GPG-agent (used by pam-gnupg)
if [ -x /usr/bin/gpg-agent ]; then
	eval "$(/usr/bin/gpg-agent --daemon)"
fi

# Start dbus daemon
dbus-daemon --session --nofork --nopidfile --address="unix:path=$XDG_RUNTIME_DIR/bus" &

# Load Xresources through xrdb (merge only updates values that have been added since last load/merge)
[ -f "$HOME/.Xresources" ] && xrdb -load "$HOME/.Xresources"

# Set wallpaper
#
# wal: Written in Python. Sets the system color scheme based on the primary colors
#      of the selected background image.
#
# feh: Written in C. Primarily an image viewer, but has support for displaying
#      images in the background which is equivallent to setting a wallpaper.
feh -z "$HOME/pics/bkgnds" --bg-fill --no-fehbg &
# wal -i "$HOME/pics/bkgnds/$(ls $HOME/pics/bkgnds | sort -R | sort -n 1)" &

# Start Picom compositor (for window transparency)
picom -o 0.9 --no-fading-openclose &

# Sync hwclock to Real Time Clock (RTC) with chrony
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
(cd "$XDG_CONFIG_HOME"; wireplumber &)
# Start PipeWire media server (Full path required for privillege reasons)
# NOTE: I have set up my pipewire.conf to autostart pipewire-pulse. You
# must either follow my lead or put "/usr/bin/pipewire-pulse &" after
# "/usr/bin/pipewire &" below.
/usr/bin/pipewire &

# Start Music Player Daemon (used by ncmpcpp)
[ ! -s "$XDG_CACHE_HOME/mpd/pid" ] && mpd &

# Start dunst notification daemon
dunst &

# Open a new terminal and send a welcome notification
st &
notify-send "Welcome $USER 😎"

# Start taskbar
exec dwmblocks &
# If exec dwm is not placed as the final command, written exactly as "exec dwm", DWM will crash
exec dwm
