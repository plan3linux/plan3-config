#!/bin/sh

echo "Installing Packages"
paru -Syyu bspwm zsh emacs i3-wm i3blocks i3lock i3status kvantum openbox polybar qtile sxhkd volumeicon thunar zen-browser-bin waypaper feh picom
paru -S thunar-volman thunar-archive-plugin thunar-media-tags-plugin gvfs catfish tumbler
paru -S lxappearance

echo "Copying Configuration Files"
cp -r .config ~

echo "Copying Theme and Icons"
cp -r .local ~
cp -r .themes ~
cp -r .icons ~

echo "Compiling Suckless Suite (DWM, ST, DRUN)"
~/.local/bin/dwm-rcmp

echo "Installing Doom Emacs"
git clone --depth 1 https://github.com/doomemacs/doomemacs ~/.config/emacs
~/.config/emacs/bin/doom install

echo "Installing LazyVim"
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "Install ZSH Goodies"
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
git clone https://github.com/z-shell/F-Sy-H.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/F-Sy-H
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo "Overwriting ZSH Config"
cp p3-zsh ~/.zshrc
