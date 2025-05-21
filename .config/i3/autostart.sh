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

sleep .2
run picom
run dunst
#feh --bg-fill $DWMROOT/bg.jpg &
# ~/.config/polybar/launch.sh --docky
waypaper --restore
run volumeicon
mpv --no-video $HOME/.local/share/win/startup.wav
