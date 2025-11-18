#!/bin/sh

paru -Syyu bspwm emacs i3-wm i3blocks i3lock i3status kvantum openbox polybar qtile sxhkd volumeicon thunar zen-browser-bin waypaper feh picom
paru -S thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs catfish tumbler
paru -S lxappearance
cp -r .config ~
cp -r .local ~
cp -r .themes ~
cp -r .icons ~
~/.local/bin/dwm-rcmp
