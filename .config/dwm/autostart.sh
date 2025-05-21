#!/bin/bash

DWMROOT="$HOME/.config/dwm"

function run {
	if ! pgrep $1;
	then
		$@&
	fi
}

# xrandr --size 1680x1050

# gentoo-pipewire-launcher &

pkill -f $DWMROOT/dwm-statusbar.sh
pkill -f $DWMROOT/window-notifier.sh
sleep .2
run picom
run dunst
#feh --bg-fill $DWMROOT/bg.jpg &
waypaper --restore
# run vmware-user
#run volumeicon ran-by-dex
run dex-autostart --autostart --environment dwm
bash $DWMROOT/dwm-statusbar.sh &
mpv --no-video $HOME/.local/share/win/startup.wav
sleep 1
#bash $DWMROOT/window-notifier.sh &
