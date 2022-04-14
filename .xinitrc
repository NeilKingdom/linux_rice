#If exec dwm is not placed as the final command, written exactly as "exec dwm", dwm will crash

# pam-gnupg (start gpg-agent)
if [ -x /usr/bin/gpg-agent ]; then
	eval "$(/usr/bin/gpg-agent --daemon)"
fi

# Set key latency and pause time before key processing
xset r rate 200 45

#Sync hwclock to Real Time Clock (RTC) with chrony
chrony trimrtc &

#Start pipewire audio server
/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
#Start Music Player Daemon (MPD) 
mpd &

#Mouse Config
solaar --window=hide &

# Polkit authentication (primarily for vscodium to save as sudo)
/usr/lib/polkit-1/polkitd &
/usr/bin/polkit-dumb-agent &

#Printer setup
# Note: printer IP can easily change if it is reconnected to the internet
#lpadmin -p HP_DeskJet_Plus_4152 -E -v ipp://10.0.0.91/ipp/print -m everywhere

#Notifications
dunst &
st &
notify-send "Welcome $USER 😎" &

#Manage terminal transparency and background
wal -i "$HOME/pics/bkgnds$(ls $HOME/pics/bkgnds | sort -R -n 1)" &
picom -o -o.9 --no-fading-openclose --vsync --backend glx --xrender-sync-fence &

exec dwmblocks &
exec dwm
