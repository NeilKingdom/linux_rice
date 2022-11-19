# PAM-GNUPG (start gpg-agent)
if [ -x /usr/bin/gpg-agent ]; then
	eval "$(/usr/bin/gpg-agent --daemon)"
fi

# Start dbus daemon
dbus-daemon --session --nofork --nopidfile --address="unix:path=$XDG_RUNTIME_DIR/bus" &

# Manage terminal transparency and background
# wal -i "$HOME/pics/bkgnds/$(ls $HOME/pics/bkgnds | sort -R | sort -n 1)" &
feh -z $HOME/pics/bkgnds --bg-fill --no-fehbg &
picom -o 0.9 --no-fading-openclose &

# Sync hwclock to Real Time Clock (RTC) with chrony
chronyc trimrtc &

# Enable numlock at boot
numlockx &

# Mouse Config
solaar --window=hide &

# Notifications
dunst &
st &
notify-send "Welcome $USER 😎" &

# Set key latency and pause time before key processing
xset r rate 200 45 &

# Start Music Player Daemon (MPD) (used by ncmpcpp)
mpd &

# Start pipewire audio server (Full path required for privillege reasons)
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &

# If exec dwm is not placed as the final command, written exactly as "exec dwm", dwm will crash
exec dwmblocks &
exec dwm
