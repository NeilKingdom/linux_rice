#PAM-GNUPG (start gpg-agent)
if [ -x /usr/bin/gpg-agent ]; then
	eval "$(/usr/bin/gpg-agent --daemon)"
fi

#Manage terminal transparency and background
#wal -i "$HOME/pics/bkgnds/$(ls $HOME/pics/bkgnds | sort -R | sort -n 1)" &
#picom -o -0.9 --no-fading-openclose --vsync --backend glx --xrender-sync-fence &
feh -z $HOME/pics/bkgnds --bg-fill &
picom -o -0.9 --no-fading-openclose &

#Sync hwclock to Real Time Clock (RTC) with chrony
chrony trimrtc &

# Pipewire session/policy manager
wireplumber & disown
#Start pipewire audio server
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
#Start Music Player Daemon (MPD) (used by ncmpcpp)
mpd &

#Mouse Config
solaar --window=hide &

#Notifications
dunst &
st &
notify-send "Welcome $USER 😎" &

# Set key latency and pause time before key processing
xset r rate 200 45 &

#If exec dwm is not placed as the final command, written exactly as "exec dwm", dwm will crash
exec dwmblocks &
exec dwm
