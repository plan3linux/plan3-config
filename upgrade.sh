#!/bin/sh

install_sddm_theme() {
  echo "Install Silent SDDM Theme"
  paru -S --noconfirm sddm-silent-theme
  sudo cp sddm.conf /etc/sddm.conf
}

apply_ubuntu_nerd() {
  echo "Replace Iosevka with Ubuntu Nerd"
  pacman -S --noconfirm ttf-ubuntu-mono-nerd
  cp ./.config/st/config.h ~/.config/st/config.h
}

version=$(cat ~/.config/p3-version)

clear
fastfetch
echo "Upgrade from Plan3" $version "to 26.0"
echo "=========================================="
echo "    "
echo "Changes:"
if [ "$version" = "26.0 RC" ]; then
  install_sddm_theme
  apply_ubuntu_nerd
  echo "26.0" >~/.config/p3-version
fi

new_version=$(cat ~/.config/p3-version)
~/.local/bin/dwm-rcmp

echo "You are now running Plan3" $new_version
